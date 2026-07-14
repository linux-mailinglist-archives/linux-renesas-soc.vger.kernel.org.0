Return-Path: <linux-renesas-soc+bounces-35184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5JTMMYQVmrwygAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 12:34:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08966753749
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 12:34:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 898873021EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 10:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41D3655F6;
	Tue, 14 Jul 2026 10:34:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3FF360EFC;
	Tue, 14 Jul 2026 10:34:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784025272; cv=none; b=dHH+LDoksL4xbxsyPEoVuVsXz6FU3/woOkW6KSFAEh+HVmHs9I++g314oNl5s8uXHDQPE5zq6PBcBpq7AtFTsuxdFlf3yljiM9NaBKvny7iUsh75lfshaYbq/ujMUR8HO7fr8IbeKZ8t9Dt75hX2DaFPxA2d5PHwxDZY16GsCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784025272; c=relaxed/simple;
	bh=L7PFV68jAhvRGopecOiQWDB18FkOZUY0hxG72/r1RtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBbk6Qd8w4cM33jkFJmlWnXaQK5stBYI/8dM3Wv+LlNzsdkC103qn4baBbaBHQSYjRYVQfdtyp4MroU57Sym+RjcsU9ch4jcUtybPEdC7dYH4I7KaIBClJ1cIc4u5ANsOJZvIcJmnk2W7uNw8kXzMI4yDipzngB2bELIh++60W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66171F000E9;
	Tue, 14 Jul 2026 10:34:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
Date: Tue, 14 Jul 2026 12:34:28 +0200
Message-ID: <20260714103428.2318895-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <877bnexiyj.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnexiyj.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35184-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08966753749

	Hi Morimoto-san,

> simple_parse_of() calls simple_util_parse_xxx(), but are random.
> Let's gather them all in one place.
> 
> Let's keep same style with audio-graph-card/audio-graph-card2.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch, which is now commit 27ecf4da5ad3845b ("ASoC:
simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
in sound-asoc/for-next.

This breaks sound on Koelsch and RZ/Five:

    asoc-simple-card sound: error -EINVAL: parse error
    asoc-simple-card sound: probe with driver asoc-simple-card failed with error -22
    ...
    ALSA device list:
     No soundcards found.

> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -704,23 +704,23 @@ static int simple_parse_of(struct simple_util_priv *priv)
>  	if (ret < 0)
>  		goto end;
>  
> -	/* Single/Muti DAI link(s) & New style of DT node */
> -	memset(li, 0, sizeof(*li));
> -	ret = simple_for_each_link(priv, li,
> -				   simple_dai_link_of,
> -				   simple_dai_link_of_dpcm);
> +	ret = simple_util_parse_card_name(priv, PREFIX);
>  	if (ret < 0)
>  		goto err;
>  
> -	ret = simple_util_parse_card_name(priv, PREFIX);
> +	ret = simple_util_parse_aux_devs(priv, PREFIX);
>  	if (ret < 0)
>  		goto err;
>  
> -	ret = simple_populate_aux(priv);
> +	/* Single/Muti DAI link(s) & New style of DT node */
> +	memset(li, 0, sizeof(*li));
> +	ret = simple_for_each_link(priv, li,
> +				   simple_dai_link_of,
> +				   simple_dai_link_of_dpcm);
>  	if (ret < 0)
>  		goto err;
>  
> -	ret = simple_util_parse_aux_devs(priv, PREFIX);
> +	ret = simple_populate_aux(priv);
>  	if (ret < 0)
>  		goto err;
>  

All changed functions return zero, but the call to
devm_snd_soc_register_card() below returns -EINVAL:

        snd_soc_card_set_drvdata(card, priv);

        simple_util_debug_info(priv);

        ret = devm_snd_soc_register_card(dev, card);

Reverting the commit fixes the issue.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

