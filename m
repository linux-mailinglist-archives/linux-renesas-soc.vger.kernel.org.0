Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896F8F2AED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 10:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbfKGJmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 04:42:03 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37561 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGJmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 04:42:03 -0500
Received: by mail-lj1-f195.google.com with SMTP id l20so1499402lje.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Nov 2019 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i/2upOf+ToEC0X7aDUoyPsf/uIOH1Z199aS+2zA08HY=;
        b=vz7uguaCHovA0rMYWj5wR/bludYJNai5H4KlogJ+KpPalT2T2RPHx3QJUM8ilj5PoN
         hiiJGFXUR/wkAJ0SwnbIjeJQRwa5qVZ1zvgGKFoOn2BdRDtrwhTv3dvxcQRy2iSX6qpw
         g3Ch7OZkBQZt+xlB4q5sTwGWg3emH2NiEqNmp/31itI3KcQ6CQ+2r/+/Lelt5pxGJ0m1
         ejfvxncfIAp51k3/uqLiAKBxQ95d5touIzsqvZI9DuTm3EKUSew3WfzLxyHVp2S/i2hR
         58tx+MhoSy3p8e2mcUJzZPl7XO6y+V4fmx0/63aLVuN8BK2RBpNur1m6r8jP/AtPxji9
         XDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i/2upOf+ToEC0X7aDUoyPsf/uIOH1Z199aS+2zA08HY=;
        b=YSb7ckTfn+4Iyzu1fNGAXMxZFqKWOsHTo0BtXRdon65O6BZYoD0Arrg6Jz2EigazcJ
         8rsXjVnaXn3d/VRHuFL/zB1cxpwxkzlcioBB8mj6VSgp1q/XkIRNJZaLhwgy2UsgWWcI
         gZieQ+24oYqNeKW2fYZXG8Jk3PkVXUwz0VSKzrL6TXesVa9YoitwLTL04C86PCGE0hw1
         7zAu5lVfZ7u8K/gMGUbncEY50qgnyb+T3R5Ebps4x/FyufyLhtu4RkY7A2cN0BfR8HmC
         l4/lilpnwplK7LhMm3CsWTCOJnMgGBl9HNgKUSvN0iDliwkCbWaWRGfZKwE0opagrnZc
         xLcQ==
X-Gm-Message-State: APjAAAW9B3XOR/LlGALSvwhdsvRtPGS6aAKImlAfT8qo3EEUQPm73oRQ
        VDJYfBpkmmHv6lDni4R7gyeg0spS1SZueg==
X-Google-Smtp-Source: APXvYqykzMioZfauLIt/7bx9nL20xI4tgGROKYzes4GYrPM+Yt9UBP6ofKEFZHIMq37c1cPyLgOC6Q==
X-Received: by 2002:a2e:8981:: with SMTP id c1mr1738479lji.8.1573119721423;
        Thu, 07 Nov 2019 01:42:01 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:60c:64b7:8889:9be8:c06d:65af? ([2a00:1fa0:60c:64b7:8889:9be8:c06d:65af])
        by smtp.gmail.com with ESMTPSA id q124sm748066ljq.93.2019.11.07.01.42.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 01:42:00 -0800 (PST)
Subject: Re: [PATCH] rcar-vin: Use correct pixel format when aligning format
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191106232546.2332745-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2b5e6447-563c-ec3d-81df-4a925449d3df@cogentembedded.com>
Date:   Thu, 7 Nov 2019 12:41:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106232546.2332745-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 07.11.2019 2:25, Niklas Söderlund wrote:

> When aligning the format the pixel format that are being processed shall

    a/are/is/?

> be used to figure out alignment constraints, not the currently active
> pixel format. The alignment might be part of a try operation and shall
> not be effected by the active format. Fix this by looking at the correct
> pixel format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
