Return-Path: <linux-renesas-soc+bounces-33564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WTOCO5NHIWrMCQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 11:38:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7763E9BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 11:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4316C306DEED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896B6360751;
	Thu,  4 Jun 2026 09:32:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10099377560
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565577; cv=none; b=cPSjr9TOKIyJ1dzx/zjdZBrX2bX8C69W/sXsYt4zpri2kt3Hs3iBXHeFdafFJclbRPyhYl74tQdSd9ZoiccMUGnEuz8xcALOxEHBLde5bWmrFUEzJbFzybpFNCExwJT7kQ+i1cJVf/aDObR2dpAsCxH2uYQNhccn4O0ZEgis4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565577; c=relaxed/simple;
	bh=KJ5n2X+HxbFCWStcy95M8JjrsB781ZTR3XYKhqt06LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrCAn/Ghl3eCqNT/mljjL1qgxipZqx89DERooVvfmnYFYylEJj+d7ojnaVh5Rz9X8EeKNF0b3zRovIznqrbTHfn/ctpxxkOCDogBRDbQUil7JXEzipw9pT25C1AhPVueokJQSVq79sy7MrfZSbbx9XA/YnPaFABDl/W+yBdW+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68ae265815aso866225a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565574; x=1781170374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CrJLOv2ASyu5V/KRm/C17ili3nS6XZLgzwNWr5zUA8=;
        b=I9iwujkGR2UPvLYFa74jm1i3BvKTLJZEqvTwlA6zIcZKlGajC/RKOTss/4RdGcL2KR
         ABBHMomvvaL9DeR9UwCPwZdptZPk1pAzMvtyXl3Os7OTIR9T6DtR4AhEt8Jk/BzoH7NR
         A88DnWISVBHadYiV+N7isYRjAwunT3Pt6bZtigXKxKkVVRn9iowO+Jlg1EjGrankEjLz
         z3AvRuUgdy0UMcMwJkAUvrNjyl57E/EHQ2Dueb2C4v3mJtJQD/l7lc5otZQFT3aaUCRO
         hO/TbrJ2qpseFFWr9ViYx3SmTnDn/Zfkr/Ajyzq9PVesOcJsZ0Zv+SCEN3EjzzFbfk5M
         l37Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ukm7i8VgkiVUcMV9rXzc9L99Iwejp+2sk7UkM8UbXFDlllir0hOTIvxtsMHcYRJJMuPp4XDoVzIOdhCwDC3CHiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0x86lSo/MX7wqRzxji5n4C4cll4UVr/m/OAKhJkwEfbYGIbd
	7T/BUEnf7Q116E/a41ao4BajtposvsKCRUM6Hss9h5/p1BK1xn9O5cOBSrdutH2o/wQ=
X-Gm-Gg: Acq92OG1+b7amlBsM8z7kOo3ONIIZ7hX9/WVW0C1nqyNXfd44Gu5tzE5Q7NNISYRuZo
	JyQ2Ww5YP+HB0dqOfGU++DPYuY1QqKTJr5VCvc37SNF/agBnx44/rv49cRN4ofqKTVqzA3P+vtd
	NE/oi+JlLS9suZOUPYnD1azmJTNDKyTAaDGAacxFkBVmYsHnurmfiSDHfw3fOosHwFt03jWGf6i
	Ie6Coy76PfrKu8kL/5EZdKF+nxWS0Er7QFynoE8QiMg5Bqg8WBE4GwD/z5oPOwfaxfSdqD5KPKC
	nHl8DqVV3Hrn9cutPxd+wjxt5DQ/XhjE/lCA19hxlf8TANUWN+lLcwRmMYxjuQnvQCR1l+ySfca
	BtCdgHs43CGH+stbxdbWQs7bw3eUmkhN3qOShTK9w9PhhhKkh7n0GSikIJKlRg9h387VToeKzRq
	KjFxec2Tr7zm2AQjqNlEL77cYJpCub+o1JHXcC3GI5qvs5R+XQjvx03BoSzHV3CIUbjZT2Dwc=
X-Received: by 2002:a17:907:2807:b0:bed:83ee:922a with SMTP id a640c23a62f3a-bf0a89335abmr250882466b.16.1780565574109;
        Thu, 04 Jun 2026 02:32:54 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd07sm282148166b.1.2026.06.04.02.32.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:32:51 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so862295a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pnw+dRM5w2RGJ5gMb++Xj9sT0/v7D+5zhWjoRKYFZ3YvzGs7w8st66E0oWAr1LPUOn7GTVeCkYB8A237rzKaiCA==@vger.kernel.org
X-Received: by 2002:a05:6402:3810:b0:683:1cc8:84a0 with SMTP id
 4fb4d7f45d1cf-68e7254901amr3620541a12.21.1780565570624; Thu, 04 Jun 2026
 02:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com> <20260603065731.93243-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:32:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
X-Gm-Features: AVHnY4Ij0I_LMXozFfIh9nNkmZ9i3aBEVnp4kYiGh_kZH1-i92wg1ef0LzESGUE
Message-ID: <CAMuHMdWKygm2zG88Pj6HYeotmteMAvqZOrSFo4DLScHLmzN_gA@mail.gmail.com>
Subject: Re: [PATCH v17 03/17] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33564-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:linusw@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61D7763E9BE

Hi Biju,

On Wed, 3 Jun 2026 at 08:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
> SoC (r9a08g046).
>
> Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
> register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
> SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.
>
> Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
> port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
> SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
> respectively.
>
> Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0=E2=80=93=
DAT7)
> with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
> correctly for those pins.
>
> Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
> save and restore the SD_CH2_POC register across suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only *=
/
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only *=
/
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only *=
/
> +#define PIN_CFG_IO_VMC_SD2             BIT(22) /* known on RZ/G3L only *=
/
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin =
*/
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg f=
or port pins */
> @@ -258,6 +259,7 @@ static const struct pin_config_item renesas_rzv2h_con=
f_items[] =3D {
>   * @oen: OEN register offset
>   * @qspi: QSPI register offset
>   * @other_poc: OTHER_POC register offset
> + * @sd_ch2: SD_CH2_POC register offset
>   */
>  struct rzg2l_register_offsets {
>         u16 pwpr;
> @@ -266,6 +268,7 @@ struct rzg2l_register_offsets {
>         u16 oen;
>         u16 qspi;
>         u16 other_poc;
> +       u16 sd_ch2;

Nit: your series would cause less conflicts with Claudiu's
"[PATCH v3 0/6] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C"
if you would add sd_ch2 after the existing sd_ch.

>  };
>
>  /**

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

