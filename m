Return-Path: <linux-renesas-soc+bounces-17387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7DAC0E89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8331C17F9D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9320328D844;
	Thu, 22 May 2025 14:44:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4328D83C;
	Thu, 22 May 2025 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925072; cv=none; b=PIr92/NAJWpv9Ptu5RKQj40h945/46luh7bKkEvFixDz4WYHfpQSxfVHBlw2Ku7Tl6+M0N7/Qd0kJopgxwBKzyOc+SrU0FpoEBGAZkE56hRM0Wpo+IHyVAM73NYnv70y4oEHYsbsM04X4Wpl94FKGkD12OIllCp/IhBPjyN4Y1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925072; c=relaxed/simple;
	bh=7eN8T2Lu0G0vXGJTit+4Atz7rsp+K06a3934NhscIeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUWjjants8GJfwI4x3AEO20O15HOVDeB6bZeOdk2wuMagVVTdU/BVW8JbAT5pdr+VcItXiwLqXXmAZL0VS4Oy9kTxXCAglouY5HXesAKs4JULL1z2KLPYDb2+L8DIih1SAbopPPdUGJH9UIYStbLxHCMrfR9t7PqVPUmjgPM1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87bfe95866fso1589817241.1;
        Thu, 22 May 2025 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925069; x=1748529869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoDM7/wAH6ynL7Y3OXXOPf5iYJNspTC2Ms5jOsjMvpg=;
        b=RhWMysxmYE3/FWFwhCIP0DmuJBh7TULf+naRU37j9nqihKUzNNiniTIS3QLPHnB65j
         IIIBZiO0NQ9rFjqLn0Gg/c6S45iK5Pss1NJseSDfqc2F1uqEiuMZVduua+0Gn+8aqXpc
         tIp0vdYFE7MjnoO2z6VERdSpD8bdeeReZtaB99YP7tqrd3SVihqwWbmBM2sgifEFp9D2
         JAF1KMCUjOOAuwh+b4FKoLSHLJ0XpSonx9+gXSCWJ3CHiitJsO/WIZdIPT/DIv6SO3IF
         sS6W3q4oUm41ue3D9yWoZqOF/PpVujOEq4/CJtUakSmoKktnIhP9FNTrGjGu1G9WeLha
         8TJw==
X-Forwarded-Encrypted: i=1; AJvYcCUOWXYPiVuu/i/TGvC67gOAMxZCM3y7BNdqlUcHDryQ3tipmVEsjdSA1LZfCXfK7iftHZ8zc3Urv8EFYMev2FkpDqE=@vger.kernel.org, AJvYcCV4LZslIdNjTW+TUZ7oyrWiswlysH37nlFcqBw++tHgfjd0AVxDr095sTY2BNrz7S55guy4JExXWohs3wLS@vger.kernel.org, AJvYcCVNox815iUPlJMoqm/v9a8wJvy968cnsPPXpNvxINnLXLMN+0Yn58EDTRcOsvwnex9fYGQM/DQ+QJvb@vger.kernel.org, AJvYcCVaONveH0ado9tjTIsdIvtNr+gMSNq98oRtb/Q8WFzBP92CQA5zP73np0qEH+KoZMIXzgfhOM26B95f@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdKa5Qv2X7ZDBK0JU7MV03exDSAxGaVsi5QreZhHqmdQ8fOHa
	xLvczBq7WjVnPr5wNnAvD3LLf3rFn+VPF4mT8ELmlszpoaLtsz1Mi68SB1Jv4VEY
X-Gm-Gg: ASbGncuZdxa0K2nnwO0iLFXNXTuZrB/5KP/n73X0A958LNcxIvomTSLM3hjoB0ogm9g
	h/dhccPuLcfBpfBEkbdz/L1xmwyusBuD5OBJ1OIvYRV2TN1UoUWW1oZVjHOvxtl8xHmvkfh4Gq3
	WiKSToA1/jQ29e9D0u0I716CRcTJWDtJ216zJuH8qiTiO8On7lq3O4KUqh9kPXMX910YoGm04pT
	CHJL1PEk6QyGI/pWrQyupJtmNgHkSNoJOf/Evpv3lZzrY3Z8gGCv+aBUaaFTCtwKDOU/OJoA7/T
	ajqmlc/bdIn3UuzZ6W0/2DiqrhZwYdzut9LhMCMXeKMhQkvBocTe858GVGXc95saqZ6r/MORfn6
	UAYI/DlLMWtM8Z1NQKoos1vbr
X-Google-Smtp-Source: AGHT+IExtf5OzJ6weF89sE1FyM8WpJPeXNtBRaLpF2kJWuYVykv8pC1pQxbNQ5mpTCLTYRdoDNWTrg==
X-Received: by 2002:a05:6122:31a0:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-52dba86eb34mr23097662e0c.5.1747925068732;
        Thu, 22 May 2025 07:44:28 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba7584dcsm12134241e0c.0.2025.05.22.07.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:44:28 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e290e4716fso1703731137.2;
        Thu, 22 May 2025 07:44:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV566lwmjVXl7aDz64RrE4PFLd3b4ejbiDt2IWGr1cJYhhAkBcOav/m5rMIw3hQOJOOP+anwZgbuBzFQKP@vger.kernel.org, AJvYcCV9OSF6AeGCNG8D1g4pChJIOh0jYlqQX2ZYXQI0PCwkgPbjaYw/clhR1WQ2qypxVbB0ScYEFCWWKXtz@vger.kernel.org, AJvYcCVCB8B5E7DUSfo9K0BBUUP31FJIRiEZ36taQLTld/EHCrCId8ECvFUt05Xqd6egsLzDhmV+Z0krNbHQ@vger.kernel.org, AJvYcCXAjHfFX85OQE8NF/niYbra3K3jZDhz7skdaomXuEhRhQ2zyLvzOGjeIdMuLBQx9Y3Y9gb/pAdwXyh9EefO1R9WcX0=@vger.kernel.org
X-Received: by 2002:a05:6102:1628:b0:4dd:bb2c:491b with SMTP id
 ada2fe7eead31-4dfa6b54db3mr24231590137.7.1747925068345; Thu, 22 May 2025
 07:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com> <20250514090415.4098534-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250514090415.4098534-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 16:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWV8G78ePzGwAiVcp5PXz9dtN3U9zreSP_fYC8xgKsbkw@mail.gmail.com>
X-Gm-Features: AX0GCFs53T2SMIq3OYUqZ6vyMuW8SSfCIPdxDsefQIHufsYYJhM0biCecVwwioc
Message-ID: <CAMuHMdWV8G78ePzGwAiVcp5PXz9dtN3U9zreSP_fYC8xgKsbkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Reorder the pointer members in struct mstp_clock so they appear immediately
> after the hw member. This helps avoid potential padding and eliminates the
> need for any calculations in the to_mod_clock() macro. As struct clk_hw
> currently contains only pointers, placing it first also avoids padding.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - moved pointers after hw member
> - updated the patch title and description to reflect the new approach
> - collected tags

Thanks, will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

