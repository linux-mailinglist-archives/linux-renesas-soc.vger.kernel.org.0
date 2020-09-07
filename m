Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48FD25F4AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 10:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgIGILi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 04:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728013AbgIGIL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 04:11:27 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D93C061573;
        Mon,  7 Sep 2020 01:11:25 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so14980290ljj.12;
        Mon, 07 Sep 2020 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4x3b3Gg53/QoChOehhMF0HfM7H2Z3AdxYrpI7W1n9qE=;
        b=Md1mHM1kyVpP0mk0VYqAYn4fVEwETn8IrrU57eD9JgwPSCvRGvuR4z7iXsKq/ff7Z9
         BfxXgAhw2qtM6coqRxOf3hLvgManA7O6UZ5PlVSimFIylom5zXMI5/HCs4QWc0nDICQm
         H5jLTG/FW9+nzqXE3BP8IhcJ2qSBOy4QYmtzaIVoSmj7MzIre+u2C+N+ayY6+Oao3l2Y
         9uZO/kAEga6Vlqwk/0R23sFack6m6FXyESjHrsimE4sHgHlFxtz6ks6FQeC1un8Gjx+k
         qMd+L3G7H2eaf4uryLfFtmIBHyTHDOtZYwTBeY9pMRb2R87JtyweHej5v6eNvrGTaQR1
         IpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4x3b3Gg53/QoChOehhMF0HfM7H2Z3AdxYrpI7W1n9qE=;
        b=jXFdxznEUI4MBfypi4jJYTUESFCllPTrjut5+mIObBS7QygQHRqL8m3snSY4aV3dpT
         euzBLVh03KKVEfZQ7t9uTBwWKBunZOeLcwDpaInRy2iktbwP1FbpXBVH/BsE/qs3zfIo
         juupd8AmtFhJNvvnEykRPStDvWZ5LxlShKsMmCuOYvWqY5M24Pw35adZX92pUlscSGHu
         6q9VLtm5mMvSTw9inZuYde1+KExrCqdFg6kk+Z91hbA+5fVL6bJy30/WpGEYo154sWD0
         FJNAXvr1nzLMIfM5Ne5kZjvblRj+jyZV97dBMNZN+sS5vfymDyZZHTw+2lfwmQpRiflW
         8SDA==
X-Gm-Message-State: AOAM530k8iSQAe6SisChbxL78QyeDz7niJLL/7XU9IfIqIPa9PcUX/F6
        H7oNwHL5ClswzDDXe9XEY+M=
X-Google-Smtp-Source: ABdhPJxloq4EW+hzTQXi0U2oQmgMwFgecmA1KwBfS3QQnusRm/qLZRha65WS4RBSHkMjDTN1iTT34Q==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr9537858ljc.323.1599466283823;
        Mon, 07 Sep 2020 01:11:23 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276? ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
        by smtp.gmail.com with ESMTPSA id n21sm6422769ljc.89.2020.09.07.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:11:23 -0700 (PDT)
Subject: Re: [PATCH 4/9] arm64: dts: renesas: r8a77961: Add FCP device nodes
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
 <87mu2270se.wl-kuninori.morimoto.gx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <45210ed5-bc34-990f-b92f-0ec5aadd2488@gmail.com>
Date:   Mon, 7 Sep 2020 11:11:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87mu2270se.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07.09.2020 5:58, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.

    Was tested?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei
