Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD3725F48C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 10:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgIGIHJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 04:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbgIGIGZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 04:06:25 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8EDC061573;
        Mon,  7 Sep 2020 01:06:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u8so1495290lff.1;
        Mon, 07 Sep 2020 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2UKtxSDsLOJMZMvP4V6fDHQ9DOK38Nub6TkWq2gStU=;
        b=vFg4C207s1HYEz3DxFduhR35WgnfoYhDmDerHgHdYFuDCemywqeA2dEAKzMmt93QxI
         RI9/AYrJGw39gr3JEB8H5Z6BNrq/of0J4kSiWqMuuqhnUaYVe1CxuQ1SwWhm7tsnvhzu
         rk3+M8zBe3OOOu7dTuYYzZmSJ9ty57aY+46fLPTbBmcubNdRwIwGW2mxZKbrVzN2nfkT
         1PsIFUOudcginzFbN9TwBL+QrV8lRO/Fkt8mI0M6t9/s/VwnlNWwOeUexzdRtcbcbyWa
         9in9OfoYHHu/S2RFfb2Jjei/bqpqUzdDlKgixUsZCdmrxp2Luu1jAiM9imvMqLsC4EbY
         2OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d2UKtxSDsLOJMZMvP4V6fDHQ9DOK38Nub6TkWq2gStU=;
        b=N4s4lI+GSR9FUnqjJx9wyb62F/IDiaK5522trgcTYGUp5LuIrBDVEro/GCwZEsQjeB
         qB7uPY1qvLeKuQ/5uxblJn7u6o5ArNJc27pYKYW+gG+Oqj/ON8R4xGbhgeOVs1amwu3f
         U22WOUaBpiWMq7ftky87dXp1ChCYXTXKzTIVQeEXZddTuO2eX8rmKDhx2OHTndsd33I9
         c4mWQBuZSUIjqizB3O0CNLXxD5kBnlWlZ8NRU/am1Gvn1KSrL/zPjgzWJQWC+RJOdhVE
         +VkXXBRDsjZNHuKrQWJlVwFjWXoTKtix62wtiLBQYccF1piiUWNnTfq8Eqo5IJ0p+uAs
         OwDg==
X-Gm-Message-State: AOAM5321WKktTiDyAXdFSIa2G4pvK6daUBV7SJNtmwCj5nCRbB5YvR50
        2TRSuNtt9VkPFBK48AnngAk=
X-Google-Smtp-Source: ABdhPJz9n9KbuzMzDlSQa4iknXvJcYJO+CSM3n5dQxn6kAweLvkB4JJPqXoF448FuJjg3rn3KOOgAw==
X-Received: by 2002:a19:7e02:: with SMTP id z2mr9554798lfc.130.1599465982981;
        Mon, 07 Sep 2020 01:06:22 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276? ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
        by smtp.gmail.com with ESMTPSA id q22sm6725588lfp.40.2020.09.07.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:06:22 -0700 (PDT)
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a77961-salvator-xs: add HDMI
 Display support
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
 <87h7sa70r7.wl-kuninori.morimoto.gx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <17f337ce-99db-18c3-491b-d29f1046d0e9@gmail.com>
Date:   Mon, 7 Sep 2020 11:06:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87h7sa70r7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 07.09.2020 5:59, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch enables HDMI Display on R-Car M3-W+ Salvator-XS board.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested, perhaps?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei

