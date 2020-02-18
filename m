Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0E0163201
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 21:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgBRUEU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 15:04:20 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34946 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgBRUET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 15:04:19 -0500
Received: by mail-lf1-f67.google.com with SMTP id n20so364635lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2020 12:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aM66lfDSRT/f+esnTacNlEppcR7A6Zjl8EzJ4jCam+Y=;
        b=igB4o4p/5wY0P+/p0TzcpHFKeM1gb2a07UUtsSOJhK93YTPIimExJAS/tjKFSuvNgz
         Kd2wufXFIJUnMMQkPy0SXw7qUGeG9EAOL5FB+yCPR4bV9++0scARfYmvg9NPVta7Ml2b
         ixiSybefbIZUb1eZ1TMmz3fBG/U+KuS2fZcHKj1z2VEXZSgcJVCNDJmxBOIzVUxqiFQo
         11YT7CxQfExlgghggaVJNZmVozrC4Q83NpRQhgAiLEk7leeuyKna+yFwL0/LdtxghhC5
         9L+ZsuBpE4zd69+cO5b7CsohZf4ZvEMTRlmkFwTCkRrbdHfZmCpANSdTyHL3+tGvfNw3
         vzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aM66lfDSRT/f+esnTacNlEppcR7A6Zjl8EzJ4jCam+Y=;
        b=SBeNVxYqVn3yLdq3bDWd+/VAZ8kZnNND6FlQb5xWWgGcgAg/w1Rqup6p36Vz1dWEwe
         haWVnnKZ8udzFhUL6NSKlX1ussR8Qq3ftJqgOvMurKT6Hy1b8Q4eaGsT9eluR5hqK+7q
         s4kVSfqG6p2G4izuWxGEtzWAQAhYvewFWXlr12RKEnj6LrzB6eNMkRZhVFByUjfSaogZ
         7OIk8AjX4l4S8LmrwUgH7RvuTMHWE8nZmxzIivsqG+b/LQg5d/0WUQxqCm/MZy9YHI36
         YDu+6xor8bIWgagMdZhHxvLSN4p6Vn4Jf5xUzH8XfAtenS8EXPPlSP6FLLHmthpEoiPF
         fhmA==
X-Gm-Message-State: APjAAAWGvZVSEPBvsqeVZ91ht7UrG8LXZEtcGbrKQx1unPTV8fNlVLzm
        cvt/crMHgRV2m1vpf/IoBsmIBw==
X-Google-Smtp-Source: APXvYqzWDBpXYwxXn4wt57AM6nDwd9YXfpIra9+UhFJMU2G4Pbg1imyPZz6R8cDyJZvn/SK+ZVGttg==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr11126490lfp.121.1582056257344;
        Tue, 18 Feb 2020 12:04:17 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id y23sm3075680ljk.6.2020.02.18.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:04:14 -0800 (PST)
Date:   Tue, 18 Feb 2020 21:04:13 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7745: Convert to new DU DT bindings
Message-ID: <20200218200413.GB1016123@oden.dyn.berto.se>
References: <20200218132217.21454-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200218132217.21454-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-18 14:22:17 +0100, Geert Uytterhoeven wrote:
> The DU DT bindings have been updated to drop the reg-names property.
> Update the r8a7745 device tree accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 3f88a7e34af2c28b..3b413658eb8d8fac 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -1506,7 +1506,6 @@
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7745";
>  			reg = <0 0xfeb00000 0 0x40000>;
> -			reg-names = "du";
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
