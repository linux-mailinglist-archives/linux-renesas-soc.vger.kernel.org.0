Return-Path: <linux-renesas-soc+bounces-18735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF8AE8795
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28283A5CBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C6C26A0D0;
	Wed, 25 Jun 2025 15:13:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193F26A0AB;
	Wed, 25 Jun 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864384; cv=none; b=KM0P46mkZsgukny+kRe53/6C4B7e/M6DnyXjgGPyCYeiExxKG7hgppiFA9DljY5ONhZKrjZlGccIniJgwZIZh+zyW06T1WgvVExdZqOsAwtSkLU8gQfQRocIA8gmnxLKs+UR76wPyrdFCYhWTuZM7kvYHdiKNO3+Wwd8pHvijK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864384; c=relaxed/simple;
	bh=doujq3pVBT4abticu6BLUeL7j4/UINv+1VAnO6ZjsA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s21zADg5ISHqPT4oTFtgwYADH4L+xzJOXbCdH1QftOVW3JrJ2C80RUR7QOXedFIVd+sPD/ptmitZI3JZJWJdhDO6VBAZeM6VQUic9MC0r2JiQNRBi4d1EOXGr530LUgsTUXsJ165Y9K4mzEExPrV4u1WrMuMWqF9xBoVq5N8Qp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3862646eeso431752385a.2;
        Wed, 25 Jun 2025 08:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864380; x=1751469180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0dyYw8IfQp7v2LRIThG2Iy4gcFWIs987F5cu/YPOvY=;
        b=Wb8lIzQZFgQRJUuqYZmgWPAaJXbaUz2rM6RXblHn5pyyKz24SN0EiRXeJI99N0kgXu
         J0/uJWFubekD7XBiS1SlMSE+sYiimSCsOaDQJgQJ51h118klPGRDBa7nIfhYvUaFBlge
         o5cZ1Sp6h85WGwN33Ha6QnN17HsOUpbdG84wlYvU9hwxWB7m94vxGCa1t2ENkiiy3OdE
         ukwabW8PXa10HwszCJ5zC3nmHWhXQrMDqcR90jFJ/dD6NM2ISqKURzIVz3k+MvH3ASML
         /wRxPTRVNqAJdqgtv2jjqNZB+5ZrtrLskvDnno0Mcu15ALe8XdDgzU54+IhLllC7oxXh
         0LtA==
X-Forwarded-Encrypted: i=1; AJvYcCUOcNGqnyG8YEbSKhvqpFdMfIPc8GpH8La/0lVy412hYFXwUQDyjAiLv2T3Y7RBIRikuhhhnvY23G0l@vger.kernel.org, AJvYcCVUlQ5Qp8i/WijVTHfcjTNRJc5WnfMpkBDGDZOjhnGFWOwoqOJkyxcSRv1Kt+ywl2SY8M3ZM3vUSQZl@vger.kernel.org, AJvYcCVpKeDdPqEkkMOBLhj5pl+W1QA7dWbBxOH068I9u+OviDmzIPuMZCpvXW23wNJaYxwyE4xEoTI4@vger.kernel.org, AJvYcCWHmM5mFd/kCGXUIMPOZSnv0m9NFZeaIJqWJ/RLu/R60dk9+XXx4jk7Of1GWEbDHPamUaJZc+i54Lsu2NHfDtNfnVo=@vger.kernel.org, AJvYcCXFG92Blqg619NRdx6jeQX7l9OHxotV4HrHimvViJMA0qm3e8dmmAtkcONTXuSm7PZd27y51CFl/s8+ZYN7@vger.kernel.org
X-Gm-Message-State: AOJu0YzV6Cr7Rlu+eNzIDxkk7AMf/NR4LgkLQ3NgOi+CcnXuY18uv9Fc
	FIoOENxpLc1CCvoMGmEPOVBTf/9GIPJgAPCUSrZDnLOikEyJNR9JbQwR2RsrhxNI
X-Gm-Gg: ASbGnctRze2QNlOHvjx/vuOgmGztN6ayJ6au89lYmTUnd3XrvZr49VIlovdzP6JINos
	IvQuKgY9LJ8/dleHnjN3W40AEqecjkL63jaSS86iWBndODGbXGi+nqrySLQ10FKd8CWd2OCvwUr
	bs+dxp/OXJ7HArzOLKtluyNMwC39NMHJHISIvMdE+jQL1mJlWhBg6EjaLJpnx2MNJ6SYUSWjn9z
	JVI8GxbXNolXnKICX9vs4JluusimWeBLqR0OZ/cVtExos2KZAO915D7e4tHLJAn6mvmU0H7H4LE
	6Tunuxg4oEy1qUw9y2SBavv/LhDSZ+AWNWf2aXaae2xUUL20czQdoHjqM78PtNYe2CmW9CGM9ri
	z+WhWP3sPjvEIRdE3RTdDxe73+AiK
X-Google-Smtp-Source: AGHT+IFx8NK8Tgdd2qrdrRfFqYVP7IvywERkDpj9fdLMh7ThdkqFVU10uIK+Ey9qN9wP0RiTZ4zKPQ==
X-Received: by 2002:a05:620a:1a08:b0:7d3:90e4:157d with SMTP id af79cd13be357-7d4297cbf79mr529875985a.54.1750864379587;
        Wed, 25 Jun 2025 08:12:59 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999db4csm620263485a.15.2025.06.25.08.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:12:59 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3e5df4785so443617685a.0;
        Wed, 25 Jun 2025 08:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEgzjCLwfMr8aQ553RjQ/Aq3CA2GKx5RMSGqdWPrX9H4gZSa2/w1s+ZFf3sfTdlxUduRpHM03us4Kx1a9f@vger.kernel.org, AJvYcCUv8DJBmlP3Fw8W6l/zKMXc7QWjf7xQ6gyMll4WDhdgvqx4+WXjB9T5SJ0NwbkpAQnMqeOaJH6L5n9NAqSUN/lHlBc=@vger.kernel.org, AJvYcCVUhtf8rSR2xgZf+WkoVvkvmE16W5Q5jzdKEEVgoRdjUtYnlE2zbcLuE8Howqnv1xSE98W6kagS@vger.kernel.org, AJvYcCVu9MfrcMIeSDNvUWkWZAQUCijgQFv4sr1WQ5PAByRwR79KqzjJOCMUFfoKh+WrJ976Kmd6nhGJtQjv@vger.kernel.org, AJvYcCVxD5p0MQp/4OI/ydX8Sq7Go07O/+uOMp7N7oyXD3yHY0FgnZgUvskhUQDvfKnmhrySYP+TbFE4+0Qf@vger.kernel.org
X-Received: by 2002:a05:620a:1a28:b0:7d4:f7:3baa with SMTP id
 af79cd13be357-7d42970ffa4mr479610485a.8.1750864378765; Wed, 25 Jun 2025
 08:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com> <20250623080405.355083-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250623080405.355083-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 17:12:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1mEfiL3e=NwSjTchpDXt1YTM3AkS7K3aR5h4FK94WCg@mail.gmail.com>
X-Gm-Features: Ac12FXwsfcXtQcl1AL1H_21vDL8HbRYTR4_tq-vWVjK1gZ980dyatR86pYQllnY
Message-ID: <CAMuHMdU1mEfiL3e=NwSjTchpDXt1YTM3AkS7K3aR5h4FK94WCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 23 Jun 2025 at 10:04, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-1)
> IPs found on the RZ/G3E SoC. This includes various PLLs, dividers, and mux
> clocks needed by these two GBETH IPs.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> v2:
> No changes but resending without dt-bindings patch
>
> v3:
> Uses underscores instead of dashes in clock names

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> +
>  /* Mux clock tables */
> +static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxc_rx_clk" };
> +static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txc_tx_clk" };
> +static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxc_rx_clk" };
> +static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txc_tx_clk" };

I have to ask you again: these still differ from the similar names used
on RZ/V2H. Is there a reason for that? Will that cause issues later?
Or is this to be sorted out only when the PHY driver will start
supporting these clocks?

>  static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
>  static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

