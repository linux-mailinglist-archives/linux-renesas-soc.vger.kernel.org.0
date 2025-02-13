Return-Path: <linux-renesas-soc+bounces-13109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1ECA33B55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 10:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60DED3A14A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEA520CCE3;
	Thu, 13 Feb 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOb9lfsq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF220126B;
	Thu, 13 Feb 2025 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439529; cv=none; b=M5NhtV+BE+GqWr29/HKiT2Myg03hv5nwMDejJSRuZunu7GTlONJNUui7ZeJf/lhVtTZiyLh4LT6bNuxXUKVBNppG61mJC7m2Wm5AwOfcFDZbt8pERSk6WyBJ9bofSXQ0zSsd19t2OmOZzPCLVUD/NWwCO3c4icLCw0O8E2lDJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439529; c=relaxed/simple;
	bh=4cygTJ3yR4tRKLsP0wtV3KZdaGLyfmfHvIucsUrQvDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXED6eDWbiK7aB80qykm3SvJJQlUQ/a8ErW6nWOYwmzemVuBwZuWp3jePH02Oce4ZDoSGfQFfrw6wzAAEOwmq92CjZU4HarIXvqqGbgW9aBmwcmPZU4xX5plfb5+DGAPY2Piw9izSeox27QbfpS7zBV80Jn08UB/4QmQQ0Q4NXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOb9lfsq; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5205539e38cso152560e0c.0;
        Thu, 13 Feb 2025 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439527; x=1740044327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7ubcBm+BUx/asZzvcxH/Scjsub7kB2AzjvxwQhJQeQ=;
        b=kOb9lfsq1j9pGRT4ugkiEFA+AtAvQo07IWLO7olzeEAOSrx8r4iNNvjsGViefOshHA
         4bXVFzZhvXfWGp3ClbtTeZP399BGXESyk+sTdhTJze8L+SfGIzXV97LK2NDrW1qy0I2B
         eykVkgXoR51brQs6fH0LgOehS92PiT85Fjh0cyOmH1Vak5zgCTVU1zBePHlAXp7bhuDS
         wihFNH6SrnnAwdi00139146P/zdGJrrwviEbPBRACRdLHMy3dwOrB8iOstmC1VxTnlkK
         Nsl/x6AoAX+Fy0Yl9i9DFIukBCMI3fXa867g16hQg7DS3VyQv69VaowU5+6H0kfvIGsV
         iZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439527; x=1740044327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7ubcBm+BUx/asZzvcxH/Scjsub7kB2AzjvxwQhJQeQ=;
        b=M2Lm/aLzSvnxS8GVUnegWAgskmQXkO5HSIdhy/7E89xhPzdEsqwrj5ohpE8qOMHFaY
         KsDqONdvZyqWpXpLQWq2GTLDTGvtdTF89tPyl/3BYsYRP1eABW0jNYozSZYTSqigsu+Z
         U+nfu/KLlNUR7FYb8wiImDyr/694fSpEpmKIttRSdvg1iyLxu/k/nDQdx243rMKpEfeK
         cmhFkeK5EwVT49cmmoCDfpG0aJ32pK1Cztz3RyCXL012fjNBsV/mnJF3tCA1MsuyMErQ
         TEHwGJ/9iu1SEJsMtR4VCCEnhNaWIevMnDWO3DVor0gE/4pUP8vLLkUTZ/yQ98HKox59
         TjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXySrzi5krTCT5r0hujN14G7tI+0UDFuvQsaqsXisnexhhTLn0ofNh6ImkQpaEQSwKq80RnWvGqQEBWZvhGbltxY=@vger.kernel.org, AJvYcCVzuxrUK72YNZE5H7HznGeOXZZDOsizxmMnBwcc7hjNTC5NOgHT+i3asPZUr1BeCJ90cP4HtMYliUdOrzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPzHfGkFabMq8h48QY+X9892e2eEGgQgCHxpLMpq54SVXYO7p
	KeR9FsVPh31w0hUHRvaNHkY8v+scM3sgxz7eMhwuoFcUrvUqsxgq05aDHDFVG3j9BnECMfHRSSc
	yNUZxDQNbnoVCqFt2R/ndrPMbsMs=
X-Gm-Gg: ASbGnctkuJ+IKgLQKIsGpLdcXRrRSNH73fI3skXQmCf88nCqousYuHMpNcYdRVPsnLi
	idOwqq1UnkYihzW+i2yPs1JaHAdltpBWsppjYrKLlxo9GY3AuQM2iz/OjeN/G3lRjIGSVC3gY3c
	hjdZYdHcLQzZDrcwXecGNrtOvpaLwlTw==
X-Google-Smtp-Source: AGHT+IGtI6fY2A3V1nrTUBE/olF2KMIGJJuTixyMLAMR7gZdh6SDlvTZjDO2HvycAnN6UAD62iHauLNb4Sck06/cg0U=
X-Received: by 2002:a05:6122:65a0:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-52069c6dbb8mr5389676e0c.4.1739439527129; Thu, 13 Feb 2025
 01:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com> <20250212182034.366167-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250212182034.366167-3-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Feb 2025 09:38:21 +0000
X-Gm-Features: AWEUYZn-UeMVAYiQ2tD6IbS6GzdhfFE75lW-4DjQl4ICpd3pc7wFXosOXW-BX8U
Message-ID: <CA+V-a8vrnrrb2LsWQqW=WhdgMRYgZmExFME3bt-L92aFAv1Gug@mail.gmail.com>
Subject: Re: [PATCH 2/6] irqchip/renesas-rzg2l: Use devm_reset_control_get_exclusive_deasserted()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 6:32=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Use devm_reset_control_get_exclusive_deasserted() to simplify
> rzg2l_irqc_common_init().
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index a7c3a3cc6b9f..a29c40466137 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -562,14 +562,10 @@ static int rzg2l_irqc_common_init(struct device_nod=
e *node, struct device_node *
>                 return ret;
>         }
>
> -       resetn =3D devm_reset_control_get_exclusive(dev, NULL);
> -       if (IS_ERR(resetn))
> +       resetn =3D devm_reset_control_get_exclusive_deasserted(dev, NULL)=
;
> +       if (IS_ERR(resetn)) {
> +               dev_err(dev, "failed to acquire deasserted reset: %d\n", =
ret);
>                 return PTR_ERR(resetn);
> -
> -       ret =3D reset_control_deassert(resetn);
> -       if (ret) {
> -               dev_err(dev, "failed to deassert resetn pin, %d\n", ret);
> -               return ret;
>         }
>
>         pm_runtime_enable(dev);
> @@ -609,7 +605,6 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>         pm_runtime_put(dev);
>  pm_disable:
>         pm_runtime_disable(dev);
> -       reset_control_assert(resetn);
>         return ret;
>  }
>
> --
> 2.34.1
>
>

