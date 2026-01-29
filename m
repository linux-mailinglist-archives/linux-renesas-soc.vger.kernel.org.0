Return-Path: <linux-renesas-soc+bounces-27608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJhDJVZke2l2EQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 14:44:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F82B0877
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 14:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A8C7300361E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037AB309F00;
	Thu, 29 Jan 2026 13:44:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B42EBBA4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694291; cv=none; b=HjamAfi7cEX1GMn954RQGHFN+0cXVV69gRqpyCiULXaCJyjKhD3i4rUjKMRKGvBYEeWRvn2c3iwb+OHUcVtr+M7eAEAi/hS+pHnOW6gczf2olX6WEPCM6VaDqlJVEU5FuHx7ShlhZA8R/jyTRczuOwXlb5wysHz3v8P4RlhdXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694291; c=relaxed/simple;
	bh=OXzBgdseIChVS+vJW71bIGbvoMjbawETEFTQgROB3B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGDUnwM71FgjnJKupdW0Ibw+a86IZyV4usTWb2/MC17QgLdLOwmq5MWDILkzqgNQuQRZB7GfsS1WfapF2DpMNR8E8nHTuNHtd2jWXSGBo4ktn9Ri7Q2se4edTuM/fKsptxm8Ho5uz0AbcQ7RA6SCsFx7im0UOFnv3R99rRt4RV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso581078241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 05:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694289; x=1770299089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Si+kB15qA+G+h2zKRmC1fubtEccV/Y2DT6Bt85BeRM0=;
        b=u7LTT/X09qS253Ki9tuSAD4IQ24PswPTAd5NcD9iRBN2z33ZMqeqJOjJUhWX/Z7WlA
         VuxaIi8CD3XqFkJlzRxdSTnDzoJHUJSTpiB2M3Xi994gauvnoHYtIas8qarB0BeuIPij
         YPuzcr+ux8rzmlEo8DxINshNwqq5Px5HKp+rC3Hp82GMd7QgglGMH6FfPx04kleVA5ww
         R7DI8NmO2lskEOVb3sB67p0UENozmw61kMJKo7HtCjoMBulMAjLHbH8PGFt4oKaVKAuq
         GZfY+J9ljKKOmWAjMH4Nr2iyX5D9pZIiQrAC/4yYrc1o152VeCCr3zLp8EEPtXmXS2OC
         MTog==
X-Forwarded-Encrypted: i=1; AJvYcCUJTMXgXLdJhQf7Vc2lrO7+EcefrizGg5VmDgIGSOorE3Bc5Chk5eDoZNUDrsUQXELOC8YtSE2S9ZhUpGjPF0jieA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIbuq9C+LHn+H0klKrN1i6TtjScd+rDC9AVxp+Tjk8o55zvZi
	kVGXFmFf3UWdjVl7td1WPValzxL07aQXtvLJjxtQTx56gCuxw9Y5PTGFZPr3mJa2
X-Gm-Gg: AZuq6aKewerMdbVOj0wtO9crta0XJmn32l1ct9PzvRoS9fJUcAWn/7MQnbmryKG+5r7
	nrMF5Fn6gw3lTjBnkhaXlgEM+0c2CzWSTJ9QkGSc5klagOT3E7tTJAEKc0HcBbzfKe+EmFCKFS0
	vqrODWuMI74A8U38Tnz5gBjpNAnjtXjzHx1kT1eU6Thbln1BKemAqkGaKnlacaPyWebUYfVE6Pz
	fM+7gQ2ByXgQofgvf/ZjDajiTbXSlIMqWeom1kDKQc6CZkaFtnwS86q24wD2hv7SUD/9KxY+bFo
	j8draEf3EYmRc481yav+37cQXIL4FYOKgiq49GYaxmsOFmvBEr6PxSdHTO5BDJP7DPW6I7P+cMj
	i1CiZblaSxZJDonz8+hGXCg/+QdgrcCdPbpjbq6Xciq/Shcj6FDrJvprRTSBIU9uw8wwL7wdNrx
	prv0yXwHQ7c30BQEcnP6QrMMhGrtLpiXvbS048nLSEomcey5eN0bF8
X-Received: by 2002:a05:6122:3d12:b0:55b:305b:4e41 with SMTP id 71dfb90a1353d-566795f2f62mr3333387e0c.18.1769694288704;
        Thu, 29 Jan 2026 05:44:48 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685d2f478sm1156785e0c.22.2026.01.29.05.44.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 05:44:47 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-566390e7db3so755407e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 05:44:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKD6A4HUQ7Pz8Hf0fbWGDqDpxIhkZ/Ya+gdoNrnqBena1d0GxICDPenUBcAk3argzuRmZfPN0oU2RJpof4oAjXmQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4d89:b0:566:2fc9:6c89 with SMTP id
 71dfb90a1353d-5667959f794mr2859782e0c.10.1769694287318; Thu, 29 Jan 2026
 05:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com> <20260122-schneider-6-19-rc1-qspi-v4-14-f9c21419a3e6@bootlin.com>
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-14-f9c21419a3e6@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 14:44:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1QV6Ww--D8kycUmL_sFen_Qf+SXHAZJnF31J0NRtsAA@mail.gmail.com>
X-Gm-Features: AZwV_QhJgRHOyRufUmk7eheHuZ8kMGAesh49iuPJzs_rWC6vXd0jVMaBYCvLTBM
Message-ID: <CAMuHMdU1QV6Ww--D8kycUmL_sFen_Qf+SXHAZJnF31J0NRtsAA@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] spi: cadence-qspi: Add support for the Renesas
 RZ/N1 controller
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-27608-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,sang-engineering.com:email]
X-Rspamd-Queue-Id: 36F82B0877
X-Rspamd-Action: no action

Hi Miqu=C3=A8l,

Thanks for your patch!

On Thu, 22 Jan 2026 at 16:14, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Renesas RZ/N1 QSPI controllers embed a modified version of the Cadence
> IP with the following settings:
> - a limited bus clock range
> - no DTR support
> - no DMA
> - no useful interrupt flag
> - only direct accesses (no INDAC mode)
> - write protection
>
> The controller has been tested by running the SPI NOR check list with a
> custom RZ/N1D400 based board mounted with a Spansion s25fl128s1 quad

"RZN1D-DB"?

> SPI.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.=
com>

> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -110,6 +110,7 @@ struct cqspi_st {
>         bool                    apb_ahb_hazard;
>
>         bool                    is_jh7110; /* Flag for StarFive JH7110 So=
C */
> +       bool                    is_rzn1; /* Flag for Renesas RZN1 SoC */

RZ/N1


>         bool                    disable_stig_mode;
>         refcount_t              refcount;
>         refcount_t              inflight_ops;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

