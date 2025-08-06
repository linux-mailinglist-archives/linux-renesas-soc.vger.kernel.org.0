Return-Path: <linux-renesas-soc+bounces-20048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B09B1C7F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 16:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D59794E239E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24421DDC37;
	Wed,  6 Aug 2025 14:52:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED721DBB2E;
	Wed,  6 Aug 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491932; cv=none; b=am9kLH62+A9JqLSZt2kloeieTJmbi90QsimQC3QKQYX/k4gN1Y+8knioy45m+ksaYXMGyhCp8Ie4CkehRIwRN5H8QnKr5mZXNCdzKtGpkFjxUSPjXhZ2jjnfmCphKBwqwmQ1a3dY36wn5wfCCgTVpSYJ8s3ZF2zJ0LWRgX0LkZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491932; c=relaxed/simple;
	bh=Y3wxurFN7l3kGSAl+sJiaJTP7N5mRmm3AuaxD4riuQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdXet28Cbjxgt50qoC1ztWYMkGNitQAWReMnThaAZO/8+YANVpfAhC4Ij7ZS92PeFocv/TrHpJ2uK2naXbV7BAIvf6xTulz5kCoB+JVhGeSuiqpj3cOE89j+CvBQ3MGHP0ShQv6bdUD/Yvbv+++0/ItZksQPInyCFs8cDtLIDA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso10237400a12.1;
        Wed, 06 Aug 2025 07:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491926; x=1755096726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bUCDOg425OaXLwp4YJbQCNBVfG3s0em33qOC0MlAJ0=;
        b=R/NIoHxjRkmnnhdoBNGJKZL22huUFm25KaRrB8eVFPs40m70sPjmeWK+CfYOCEgvPB
         JVgjY5gCM5BptNF5W0wOotpMR395lAerlqHIXqSw2pOmNgU3FzSY/CydrcrWMWps4XgK
         gSrRF0iZs8xozlla/Q5wm459YvMi4TcF1BhXcphWamKktzNYkvnJ1RXY3P5BFdCn9JOw
         aCr41QsyhrYgLiJF0QFqd8xiwarq7eMWA4Fk6LOEg73HNyGBqOTlhxCX0iltt3cUH2eo
         SJfdgpHybiShOEHQRKFD7dbW/XFpvWf74T0UWnt/6XvrY0zYClG5AVLoCIYv6W5GUBk5
         9mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmsxHT46Xzl1S1/4H60GqxN/FFRoINIbXfDPQRsq4EIijmsDAbDBnNR57raFPsDtsHWu55EaED3EPV@vger.kernel.org, AJvYcCV0yK21/IviQtJezYFcKY8fzYkQGB/Zq2SeAhEretmkUXcJdKoh0440v1YjlZqFvu2/SFseuNchQzPLjjnO3e0cOJ4=@vger.kernel.org, AJvYcCXOhxRGryTNDCO6aVSPLJLHvJH19CLKpn+mBUcP7uRpw2OTYXA1Amq8AcIblGEoRRIBwFCy5DV9gBH1ZUwV@vger.kernel.org
X-Gm-Message-State: AOJu0YwYydO69iZTly/iZ5wRVBLW/N/UDJ6YmDTfT1zxwQ//8lUZeNhL
	bGBy/9FCDLokXoG1alRMxv99WDMG8bAx9ERR4dRAfLx/LCoeQ0DmwvXf4ewqdTCP0PQ=
X-Gm-Gg: ASbGncs4zUNDv7UD3lglIwIvvVCLhlDfKe9KHOQ56a7V4hRbFszpDqEUHYz1m4EV+p7
	wME/bLMQwlw/2yB9NghYvDNGUKkoXIeIRQamZvVpQCtxTEzC9jf7wZfTIyHRXc68FpN0YQEZqYQ
	3NApWq+DH340F7uCxyBXmcPMWXnIZISCpTp6reJTkpdEQarVCrz00w7i9OLOOZiaCIU4U5XyYBz
	U6U2oWV3Bfj1tiHn62zpAOQwMMdUomPJ+iRALAtpe9spVdVrf/QfD+9UyLBzc3x1GUMbh3MbII5
	beM9rtM2sBNMf31vQAep0Q+PwBggL8oZQdgzQ142eJkKqU/Pu5rl0RFbVwoX3ZEKwEYm21e+Mp6
	rBI3pHYUj3i4ETW5enNa3hAPhyVbb7r+SuywARwQuBoG0xNGfTaATzBxoRdgp
X-Google-Smtp-Source: AGHT+IEzKnp2sY04AFJW7las8FXjhIwbpDBvACmEzdBYTCk3i/OG92VxO5tX8nEISN1I4GeFwkcULQ==
X-Received: by 2002:a17:907:724c:b0:ae3:f16e:4863 with SMTP id a640c23a62f3a-af992a60dc9mr221150966b.1.1754491925395;
        Wed, 06 Aug 2025 07:52:05 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm1121069266b.70.2025.08.06.07.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:52:04 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso10237168a12.1;
        Wed, 06 Aug 2025 07:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYzjpwgz7cNovVkDKQ+xk9fqVqJjErWJHwi0do1UccdoepfIRdHhS2Nl4RTNEQrrQaMt77KR8aqUzw@vger.kernel.org, AJvYcCV2Yfy+ETtR83KuU/XbvByuCskjI7PPJU4699GVa7qdEWbiHhpFg/aqulSMsdxzTjHQ8elnX6qEJVFVC8n3@vger.kernel.org, AJvYcCVLmROIKbhODeOB8uOrQVmyhEiGZwjWpoiZu1RDVlcgFmHOfUWKicsRPai8WKMn/KFjn2zu6fdWprAgOlwKl4Ta2zM=@vger.kernel.org
X-Received: by 2002:a17:907:3c89:b0:af9:3c4d:e978 with SMTP id
 a640c23a62f3a-af992bcfc70mr250833266b.41.1754491924075; Wed, 06 Aug 2025
 07:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 16:51:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMKzJtomQzzZaHXbhhEJ_3u71Kj7QcMhRgCXcDWY-Kqw@mail.gmail.com>
X-Gm-Features: Ac12FXyYEz7rzk5aBSzN8UgmC_MvtiytMIezYQg5UvwlqRx6eIwBFlTcBsz1ug8
Message-ID: <CAMuHMdVMKzJtomQzzZaHXbhhEJ_3u71Kj7QcMhRgCXcDWY-Kqw@mail.gmail.com>
Subject: Re: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 5 Aug 2025 at 14:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial support for the Renesas RZ/T2H SoC to the R-Car Gen3 USB2 PHY
> driver. The RZ/T2H SoC requires configuration of additional
> hardware-specific bits for proper VBUS level control and OTG operation.
>
> Introduce the `vblvl_ctrl` flag in the SoC-specific driver data to enable
> handling of VBUS level selection logic using `VBCTRL.VBLVL` bits. This is
> required for managing the VBUS status detection and drive logic based on
> SoC-specific needs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

> @@ -284,6 +293,21 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
>
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
>  {
> +       if (ch->drvdata->vblvl_ctrl) {
> +               bool vbus_valid = false;
> +               bool device = false;

No need to preinitialize these two variables.

> +
> +               device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> +               vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
> +
> +               if (device && vbus_valid)
> +                       return true;
> +               else if (!device && vbus_valid)

No need for else after return, but...

> +                       return false;
> +
> +               return !(device && !vbus_valid);

... all logic above can be simplified to

    return vbus_valid ? device : !device;

> +       }
> +
>         if (!ch->uses_otg_pins)
>                 return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

