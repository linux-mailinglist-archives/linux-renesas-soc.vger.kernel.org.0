Return-Path: <linux-renesas-soc+bounces-28319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAqqCvhel2m2xQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 20:05:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50B161D9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 20:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED5DC3003D13
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 19:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAA72D7384;
	Thu, 19 Feb 2026 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5zvrvDd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FF2D23B9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771527925; cv=pass; b=FePNjVOv22LU3B0YuUnrdZbHf3F4ynSfFfFfzZpd4+rucvDXUGg+rLddencaWdIodlC+a3wmNNLDfyWpld2ULATYvFU040Hu04EG4+96Mnsn/d81I5eGB1OHqpzIQ9F3f0B1bX+ADSlxQMhu8w7qp3caYjQMDpi9Jt24Ef+3zls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771527925; c=relaxed/simple;
	bh=81m1P0GdGdANBBeAFNk/Jpcw9H/E01UVyMrvu0GY/0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+8T5RoUhBW4UruBtzZzLLfI8wlRP/QOfVCPbJDtlbeZAefelYUk69fAJ+AmqVA4btylzvKzPzoZBCt7Ex+VeeSwoJ4kkEBMDeMneh4ca63uSE7ZcX7fzL8GNlORn395jzkBQZtJhO+i8MEgEc06r9YWFXibqE8ZBqJuiC7WuZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5zvrvDd; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso10131735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Feb 2026 11:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771527922; cv=none;
        d=google.com; s=arc-20240605;
        b=O9F1LJ9W2jv44d/uf1LyY3oaSpjwn6d5TfsGBJ0mIKq8X2a1ygRBeZHl0BpZ1mo7VV
         2046ypp50zPomqkorSaWM+51v0C3P+0XxOnIATM1F9Lz2V2sL1LTsRzaW0hYA9FEwZbD
         S4VotAyHq+Ujvgvzd+NiW9RVOLwrcF2SlGtKA16Z7Cl1K9tn9hDX5OWKPpGtnjN1TX8+
         cUookyyQDxTMCwazionmpTnm1e37PDXi6Tz4FEozDi5KENT4tbLjKBuR7EgHPLhX/w2N
         GZIT+OAzBIxXXBRXGCKZ/TYgw5ODh6b4Teo4+a7lEhkyCk+oy/ymAhEuoKv2mVW1ocje
         +plA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        fh=ynhyqsLslGl8j4fZv+uGLkBitc+vj/33yMKk8abLv0A=;
        b=ZnqvJjZgEAMul/ZgGvsnslxFrqLuszQNuF2qlR1M/q1X9jJfgX5dRcMFG/t0BX86gs
         25hlLV9hpfyu9U2h7ztfPRnvkxF9nAcb9vmg+nqlv5ttuVYHEcFjs4LgiSSWMS5udQ5m
         4TMDJEaIM7zgEimJrFl3Q21YPOFcCybc50grc7Un5U8Rl0LnwDsoRFTdU3lVsjgnaOjf
         6dQxVecjXy+b6elyzqgn01J5pA6YoJLPD8FRvlcFkf1m059PacBr4YoR2iaI760soQ0g
         Co+TLUV91zdLBbrR72TsBDVgarz69sCXMR2D/HMMkLsMWn7S6tqXQm3BC0JLXtsPTZvo
         2CNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771527922; x=1772132722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        b=a5zvrvDd6UPZJMkGCxLugvTkn/USbnaM0vWfktqLPTWyAZpAFOVBXHwPcID2QsJTeT
         FDTJn79EOWZsl6NemVg2/5bv4IM3mui8TxmZTUVTJAMbu7pp0HgihmhCISoOhHIoIJiQ
         6MVbp0MuLYvBMTWjCHIiFjArqiNmuPsSUbQW5/CXz7YvDEXrF2F74RE5U1wYBN0ujFBi
         Z+v04HPAT+/qF3p+kFB1+mve31aX5cTEKehC7zCbbymShEizSbex0McUtW4vXVo6MeaU
         P3v9SL2bpFevMGs0vg7JNLyJHLicGp5sIvzZjxusqGIZsqRAAbubjMrOgRItIpZiIOGx
         Widg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771527922; x=1772132722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        b=dpsRhW46NDUSoE4bNe0uCxTjnFDwX/avOguPcAmfyDz8zGRaaHc9LVgNk9qV2PxcPV
         AZTstKc3g+BMgWseNrcRxgpAIuOKmpboT+SDK8BiHDZTvjjULTfmpFmra2cebfiQjc91
         Ss9QO3PBxik4jjYQ7CZmgftw27TDCvqFSlD0naROYZD/18u5nbM1vKZRUd6lVRoaAlNW
         CeZf1KVL/PXPBMqo4Hhrh0bQWV+FMFyb/kBVHgJf4CT5bfLVfEqHLulsegrQ8PMIbfUT
         kY8xxDydZRFH0rqXo5PevKYB0s2QBiCdP6onKudTp14WdPnUmDrn5AQ8ZnfmXVCPpExJ
         8aIw==
X-Forwarded-Encrypted: i=1; AJvYcCVJh2Ls+8brG588iCJELbU9rrg7tbapf7S0pCy5bznb20pJtBTSbIOrZVZfv33kUfzHwzWH34TboDGTy5ZItcbi8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2iVc6fa5Jq24rzeF962Eo96mhB7W3F38d5rJ1+CsjaIVA+Xz
	g485YHVRvw6GZFtfn+ZteS6aWB1TIWRb48kBZMM2ybB97zZelRrLEpGW0G0CmXi4uuJSza6tJdV
	mKrDq97lwFDVtp0oTQNZcxRThqtD9vfk=
X-Gm-Gg: AZuq6aIxShRg31k+e1GFCYVIchXIjS6aoTUaSJDMQdrigRcRSuolzcaTcJjk/Tx945B
	1JZr3kB2iLvTYFO+IJgloETL933YA8igkCydUh6SIJ1y2dcKDkpQL9idwiTYpvPJo6XuDQSsDGq
	STdXZLLBxCfcE0cahI/BQJw1X1r7wKY/Zmj+AAP0aoUF9hK8fvfxLXEZ3NfvoLklRGo/osUIIbp
	BGUXaHTLJQShgK541yQwruabhJU/TiFSxJHzSW58D8dIZkF54lf+oxPvi0JXCiOev2uIVPewKuw
	iYzx84TD6F7gJqw3G1fkcQw143mXxYvVuAnNiWMNXce7/GNv8x13U4YrZcius5V7hGmsQabA/R0
	TiQ==
X-Received: by 2002:a05:600c:871b:b0:483:8e43:6def with SMTP id
 5b1f17b1804b1-48398ae5461mr92319025e9.28.1771527921877; Thu, 19 Feb 2026
 11:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Feb 2026 19:04:55 +0000
X-Gm-Features: AaiRm52iOuUsNkdftZ2dd-0NmouiNLVBadcGt_80jzF4MyMYCcuWjg899DEzzW8
Message-ID: <CA+V-a8uU+md7QPtf9KoZs4hMu8Xfo6Rm9X-U8MZJBYPmz8qAXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, brgl@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28319-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,tuxon.dev:email,renesas.com:email]
X-Rspamd-Queue-Id: BE50B161D9F
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 3:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 863e779dda02..641ae1adfd4a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip=
, unsigned int offset)
>         rzg2l_gpio_direction_input(chip, offset);
>  }
>
> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int of=
fset,
> +                                unsigned long config)
> +{
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +       case PIN_CONFIG_SLEW_RATE:
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +       case PIN_CONFIG_POWER_SOURCE:
> +               return pinctrl_gpio_set_config(chip, offset, config);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
>  static const char * const rzg2l_gpio_names[] =3D {
>         "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
>         "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> @@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl=
 *pctrl)
>         chip->direction_output =3D rzg2l_gpio_direction_output;
>         chip->get =3D rzg2l_gpio_get;
>         chip->set =3D rzg2l_gpio_set;
> +       chip->set_config =3D rzg2l_gpio_set_config;
>         chip->label =3D name;
>         chip->parent =3D pctrl->dev;
>         chip->owner =3D THIS_MODULE;
> --
> 2.43.0
>
>

