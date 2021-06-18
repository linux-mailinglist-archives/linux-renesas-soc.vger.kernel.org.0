Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725DA3AD364
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 22:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhFRUKI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 16:10:08 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:41697 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhFRUKH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 16:10:07 -0400
Received: by mail-ot1-f44.google.com with SMTP id v22-20020a0568301416b029044e2d8e855eso1663322otp.8;
        Fri, 18 Jun 2021 13:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6XB5kaEUWj8mAPfwEHQtLrrBX7VPygB1nsRewZ4nFEs=;
        b=c1dMvN2i3WRomLMa+i958QHJqbpL/cRiucKENtZdieJ8lOCpf+oIzDd3XKat2nYsr9
         mQ8gAgELbjhRqp+/Tb1mQjybJJWzpr+IZ5P0LWQoiCxXGdhGJGLQtVDIcPSumzye2Z4g
         hGea8+5e0DQJ/94JeqZkh/TP1u15nheCfd77BAMZIS6ekvhyjIvsigoYFcT0pSmaT5Cz
         3PLGAsB+T1CuyTvGFWFy+7r6+t5qUIiuZ5a/A+bGbjbdUhjHu/vEDsNfO/bLEnHgoE1J
         OB5fqQC4nApC6IFoOXzHOayFOKkH6qBauHmi6GcKxQpkI1B86TdC06DpSddgD85xPILM
         kjIw==
X-Gm-Message-State: AOAM5302REYT8RQhtxXyuJ+X4TCjT39+zo44d51dKUiWUHg/Z7ysLGk0
        HhcaZEZ0Ur5epC9kN84hYg==
X-Google-Smtp-Source: ABdhPJylt3V8jimpEyL3PZh/942fiiPeLRK/GFv7exT2gwb2wR9vvY9S1LYmxFM8qwSe8DywHHWzPw==
X-Received: by 2002:a05:6830:14cc:: with SMTP id t12mr4832945otq.79.1624046877570;
        Fri, 18 Jun 2021 13:07:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w22sm1779119oou.36.2021.06.18.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:07:56 -0700 (PDT)
Received: (nullmailer pid 2795960 invoked by uid 1000);
        Fri, 18 Jun 2021 20:07:53 -0000
Date:   Fri, 18 Jun 2021 14:07:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2 RESEND] dt-bindings: timer: renesas,tmu: add r8a779a0
 TMU support
Message-ID: <20210618200753.GA2795862@robh.at.kernel.org>
References: <20210607124828.1984-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210607124828.1984-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 07 Jun 2021 14:48:28 +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> 
> Changes since v1:
> * rebased to -next (other SoCs have been added meanwhile)
>   rebased second time for the resend
> * added tags from Niklas and Geert (thanks!)
> 
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
