Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5855D25F49D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 10:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgIGIJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 04:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIGIIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 04:08:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69452C061573;
        Mon,  7 Sep 2020 01:08:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a15so15096151ljk.2;
        Mon, 07 Sep 2020 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EeRRCsUX1Pk+YbMl4DUIAE6pTvHy6ihuYS6GV/X928=;
        b=IdEg4JME3TQqAQEKbVk9FfxPYBWwBbP8Fykj5xICjYIjjM82tDwRqM5Pl75eBTRrZC
         pUl0Z2y/n8Ax+xua1B6iDo0flvfRRQNiPHJp4XGmR0ijvWutEmEy5I2pl0b/V/S+1Z7F
         mJCFsXoaLqV8ZW1Z5Bq1KkBmwPj+bZebMor9PLa9+BIL9yZGh1ddBjx+0Wk3GuxHaqwz
         L8P5VxsAEvX34lRX9mcbiJmZNvuot1SDcEnKgFKQnksH5Oa+p4+zuciN0vOPzdBAi4SW
         zK4T5ECQ1B17qaqkhMzaJK/KV41lqzZ5At2rbiu7ID1yvZvHcmJoTksc67Mt2v7k6Bqm
         GOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0EeRRCsUX1Pk+YbMl4DUIAE6pTvHy6ihuYS6GV/X928=;
        b=mrcX68/vkM+UqT3KcyAPC5LvcZdy8c95rz1kCk5GXWRbURomGHpWw9uVBGmJqXLbjP
         DBtg/K0HDAulPFjJa4L5IMj/iEvJa31tQMohJJbrFp1RZsLGS+iVFNHls+8aehXxG6BL
         XTrW1/v4P43r+sktSbHF5ueyG3gqnCVm+z1jLbXZZq7qYnopccRbkBfiys1mmMcTTlXD
         Cjgp1vdu82b9qr6Oc16In0aD4GzNsih0o18FiAjSBah+j4VkwRFfayhbHS8KLSTwE5Vu
         PHlMWC1+IxGyFTHOCW6zjMJhlis8nFCao/RLyxcoNKKgfbzUWEDdg9vu6yTbv2xb/Fbl
         Ss6A==
X-Gm-Message-State: AOAM530ERt32t8x//U20CVkV9LuJjFpudWy8xIWcX3l8FwRNWDftLxpV
        BoyFIV45zcl5Hw2q90p0psHRhtZK6TEjNA==
X-Google-Smtp-Source: ABdhPJxC25zywKFu0tljNIevPK3kmOkCAt026EhxTMDv3XS1YYe4L8NkoIWFqZS3TSgl4UQnGDnaLA==
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr9557847ljl.448.1599466122723;
        Mon, 07 Sep 2020 01:08:42 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276? ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
        by smtp.gmail.com with ESMTPSA id i187sm6747245lfd.65.2020.09.07.01.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:08:42 -0700 (PDT)
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Date:   Mon, 7 Sep 2020 11:08:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07.09.2020 5:59, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested?

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei
