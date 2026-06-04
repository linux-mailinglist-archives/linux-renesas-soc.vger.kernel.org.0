Return-Path: <linux-renesas-soc+bounces-33583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cFHdAdNqIWqBGAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:08:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFF63FB90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:08:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2773B3022A95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 11:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF47426691;
	Thu,  4 Jun 2026 11:59:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786D3F1658
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 11:59:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574381; cv=none; b=hmoWNran2pyAn84a57/MwsBuFA8sXAwgZ1dQJEPfBnKpH9fJD3TtIn9DU5fHJnhlnPh1UbLBAS1FU8VWe/JNttSJsI1CZAZjCYMP4FxFSsCVPzFfwd/GMG3AFFAE9JGIcKpqW28cKBhk5gnYZchWYX4acVwE4yAuOZ60o95iHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574381; c=relaxed/simple;
	bh=ywQR6+si3be3C5PHwLaMuL1HKazcqbrmNysyvyYb15o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RROWX4HBcaZFzx2B3TT9h6w+lFPjjjvNQ/X377v67Po3UDlNmlteZeVVgFe85VeZiNA8KNy74ThJq9nDtSKtEc7Um8ybRLM0G/Dek2Jx9uk+hI+vN4uG1TS8Jm0W938SvcoxAaxoJhCbmc1MkcgrwfpNqoBX+qs9kVe//SMBO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59d07df448bso480539e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574379; x=1781179179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISCTVs8so3qeH2PLNzTEp9wspkUuH6UUbf7a9c+3AGw=;
        b=aEWwDIuAFS02090rtdc7tDsseaVMK3vxcCfYYpQj4679V7orLtgENsQPOm8iu7V9GU
         odSN/9KfSZ59mkWQLGpGO4iFtBoRPNNfRzHjmiSfWVaqxxoSrB9ZC1mzU+lys1UZpKV3
         uSa+KbmxWT1yrdtamomk4fA8oIl5oN3PqVarFm5oh/bjl6q/GH2mP7EFQ6ggz3Y7TzkS
         +dUKr3PmUW0JZbxzX5BMx7dsUXitZkeNhOJhyJinnflav1HUSMcmZ64Pv5Bdz3fvcjz/
         41a2RtdhuPcX8RWeELKiMNdXrm8T6ZiNQH0a449Ywrfg68P/N6hFHHoKJFqs84FbZDeC
         0L2g==
X-Forwarded-Encrypted: i=1; AFNElJ+mSV5ssGSQy7hZFUL30u+QeHgfSdj6gzZNPQEjktb9SoWuzV5WtW/41FQ5Z86kFyXWBxsQiKLnYLxs9Bt0RbZKXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAV/Vmqz5xBdvBr0P4lysLGSsGsiRRQCD4OjV9tw13z7uU+9Re
	Bud4SouvpDItVLe4+PcWyZsKebglNTXaR2SlhebduezrlOzsGdSNNXuVW/rRtfe6aTU=
X-Gm-Gg: Acq92OEvht8jQ2Rv6mVBT580f4tD7ehmt7fPBcJj26ot2aoum+TAAcfazBvsaJFsbB1
	epw0IRdZjtCLuP14vIRUEYO2QsvjvP0HcrmNXG5Z2GfrIj4mK+KiOvbsheykBjxPhTyM8POejYC
	vXhX/ekEtmQtZiq0F1akch+nvsJvH1un+WtGCpJYltdaRiYAv6ORS3iYKAcigC3nVXnnIPE4P0N
	0lHK4YOZGFSFB/BqmwZegly4mlk4/yE63RG05Q2HIn/1A9Etj4wqWKXZMpioa/IbGri7XD9jt02
	eJe3Uo22bs7cktIl6TRC3i0tpdU92inXc0eeK2uFWUDKrerm773bvVx3BdYF0RzFcJTU72qjwd4
	Mqqf+aMyWEpiCJ8tYLXwC8jt4vFD9eLpxpxXJy/MHleFgGAwFWftKnigw1A8l2KUESb3fOvb4Pc
	j49JGArq2Ff9ZwrJuzs6LjVqeZ//Q7gk7xHQlwEYIUqtZ+j+Dhas5qqsgGvYv9rpZMhOjJYKJd1
	AmQ3sNzPA==
X-Received: by 2002:a05:6122:2a45:b0:5a0:2018:4dfa with SMTP id 71dfb90a1353d-5a6e42800e7mr4609983e0c.3.1780574379551;
        Thu, 04 Jun 2026 04:59:39 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d64139fcsm4929194e0c.4.2026.06.04.04.59.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:59:39 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so385118137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eOa4SEA3f3l9PJ/YfGslsf2GdZBueje15HIeHi9L8VSOepMflxQFdd3gTcHDulyYRcBfOG4+Mnplr2tCsfLiP+w==@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:631:4c79:b1d2 with SMTP id
 ada2fe7eead31-6ec4b271de0mr4360203137.25.1780574378638; Thu, 04 Jun 2026
 04:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:59:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
X-Gm-Features: AVVi8CcbcHPVoG2RyTFJmvI5Pqu_feKTjza5L3FARlzu4TpWPjIkF65Jen6BRfI
Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33583-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58CFF63FB90

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Model the optional external audio clock inputs as CPG input clocks for
> RZ/V2H family SoCs (RZ/V2H, RZ/V2N, RZ/G3E), allowing the Audio Clock
> Generator (ADG) to derive internal audio clocks from these external
> sources.
>
> The clock frequencies are board-specific and must be overridden in the
> board DTS files.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop the audio_clka fixed-clock node from the RZ/V2H family DTSIs,
>    and drop its reference from the pinctrl clocks and clock-names
>    lists, consistent with dropping the AUDIO_CLKA input from the
>    binding and the CPG driver (patches 1 and 2).
>  - Reword the commit message accordingly.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -14,6 +14,20 @@ / {
>         #size-cells = <2>;
>         interrupt-parent = <&gic>;
>
> +       audio_clkb: audio-clkb {

audio-b-clk, to follow node name recommendations.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clkc: audio-clkc {

audio-c-clk

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
>         audio_extal_clk: audio-clk {

I will move the two nodes down while applying, as "audio" sorts before
"audio-b" and "audio-c".

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

