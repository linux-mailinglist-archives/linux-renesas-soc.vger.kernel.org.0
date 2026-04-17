Return-Path: <linux-renesas-soc+bounces-31373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBzuCsm54mlF9gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 00:52:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173741EF1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 00:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEAD33032047
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 22:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6337342CB4;
	Fri, 17 Apr 2026 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq338jIG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B51D333426
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466373; cv=none; b=EK6zCJjy5FlIyd8Yu+7SOdDwxnWQWHBlikQqsfMFwxW7Jd9nVSqXi9nFCbi242H/ITlsXS3cIE/sMZTkXn/HdaL+GpJDGxTgkMQs/qiEXo+1L9L7vF7qB8ydrAJehjmaO0DQN7A3cz9bP6huSxNtxv+kKD84W3eZVyXkrAMOULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466373; c=relaxed/simple;
	bh=7lRGRgO+sY+Tbxa5k/XtW9OKVistKJlg859ZG++Wb+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa1+PorHIItFAVZkr/v4BN0k/z6YWyIR2QzHzVhHA6Gy49gjVGmOhSS3PPr/mUhbpJoBCqt1+QWmOb9k39+bJcBc7qxljgOOlOfZj1QGqGojxeKWWsrAcoOx7Xeai/wf4zsIfEtKL8gRwH0JpdgBxN9q6tMUHVDimMJPqvCYsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq338jIG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso11955165e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466371; x=1777071171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7b9iJ8FYU8MqXaQzWePrt8eUV3AQUrbeqNJZgHzFab0=;
        b=Pq338jIGCJboGm70RZIPTV22a+4zkUwQzhrlquloVTMmj+Y2BJhdkbuylNHkxPnn6V
         WddFC3UVHEPUaT5IB4ZabdTwmmhOG9lSczHsnOgGrJpXtkb48unkJZGt/7L/N5wbSVUd
         /xO6H2LhsYgT/NmON3omdnOtVB1UaEJk3Ug/XY4daq9PUpjh2vAFZ+Icaf22nr4wLDrZ
         634Y5vt3cKljmiVGEDs6DzuZdFIF0dMo/3KUe3Jwn4TtVfVfDUxoHqkA9ke+qjCDyuDM
         //i9YhrL5IP44RyTOYioF9n1KQMjuHAlt2mxaPK+UuO6lv6SZFh8aJDtGq2LKRwA8x9N
         do6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466371; x=1777071171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b9iJ8FYU8MqXaQzWePrt8eUV3AQUrbeqNJZgHzFab0=;
        b=Q29bzMAWXfSL96SyTOtK6bt0gns8UoWtJwmGUE8sfk+YUfIjcFrn5uzCBZKixw1ivl
         t2Y0eB1DNv7Mqo79+moS7sHFNVZYQoxkfQxhBrqmbupIfHmXiwK7rJeNrTsz6kTdrnYv
         Af9ZJZJKxgIheUwHylEndupxa6G3An+pZulcqvoUr4kVbNijJus6vH2/OiBRwPrn0tkB
         OEoElx6FjkQKdSenZsunAceur6ZylM7gNRJ+ovIKPeJ3i3kMCDVWZpD6sBTLmD+Z398q
         n4/Y7yt6cMdtDD1koMGgvFjPiTUB8DmNNZnZAQT5CKHh2w+Cyx6CKJ5v0MIrZdDSH6bm
         ZUUA==
X-Forwarded-Encrypted: i=1; AFNElJ+u9Dg1vuvRh9uw35axWTXTJcUuWxN84TmVF01VabgAkak8r6tLO1LFum337/KG0KzbT577WLKLoJ6ZVylyK3JBrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyghmM31wYn9dTZUqLDokistgjm126KhlNrkrlGZyH7WVxhLk6Y
	VPU0wCJeSY4LRQ+xEQJsM6kglhaLpKv4iM+u5ASEXh1PL9xj9hmNi6H0
X-Gm-Gg: AeBDievwBPl1LVaHoJKasbP88lJX1dJAcdQ30Q+ulsXW57CcpDZYPmqncdaMwGqeXCl
	+M2NwbTgl8PnrYffqtNYxtE+8MRHIkxxqOqofHjSsfn9RtEo8bbcX15ilH6RVYYk0f6SbNyBYTE
	sFoEAD+cYt4PSKPHTggyUGwhgdC5Y/ERx4MrxEkuv0uNFcA1kN+nE+dKUIHo8N4aaebN4FxyYZI
	7B3Ud+zRRXSoiUPa7z/SHEpFRK+VKjdRN7ygdt5KtT4JYTOKN8SQwsd5oxGRVf2/3kHqQNS6GoV
	UO2cW0D/aVzA6qPuYsK4H9KH7MootOY1J6CV7RCP1q8I1by+ydSluUOp1WJhA8X6kEj237q1c3l
	iz5VAG73DwMBNxN0lEmMGT2VXpPFpANqdZMKrLPls8HpfedfUImlCOEEbSoeBQlNMHZ8eyNPoXl
	bs/7bhmOG/I8s/LkoDQe1UvWIdwbpTcvu/8Qs+mj1vP8BZ1So228oYoymIAz3upOlnFpU=
X-Received: by 2002:a05:600c:3150:b0:485:3b00:f93b with SMTP id 5b1f17b1804b1-488fb79df09mr72042475e9.31.1776466370571;
        Fri, 17 Apr 2026 15:52:50 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc143a0fsm80393065e9.14.2026.04.17.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:52:49 -0700 (PDT)
Date: Sat, 18 Apr 2026 00:52:49 +0200
From: John Madieu <john.madieu@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names
 for RZ/G3E
Message-ID: <20260417225249.mvi7sygew77wf374@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
 <87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5paz1w6.wl-kuninori.morimoto.gx@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31373-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johnmadieu@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8173741EF1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 03:44:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi John

Hi Kuninori,

Thank you for the review.

> 
> Thank you for your patch
> 
> > ---
> (snip)
> > +struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
> > +{
> > +	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
> > +	struct device_node *node;
> > +	const char *unprefixed;
> > +
> > +	node = of_get_child_by_name(np, name);
> > +	if (node)
> > +		return node;
> > +
> > +	/*
> > +	 * RZ/G3E binding uses unprefixed node names (e.g. "ssi" instead
> > +	 * of "rcar_sound,ssi"). Try stripping the "rcar_sound," prefix.
> > +	 */
> > +	unprefixed = strchr(name, ',');
> > +	if (unprefixed)
> > +		node = of_get_child_by_name(np, unprefixed + 1);
> > +
> > +	return node;
> > +}
> 
> I think it is better to have name get function, and use it on parse func ?
> 
> 	char *rsnd_xx_name(node, name)
> 	{
> 		char *sub_name;
> 
> 		/* name = "rcar_sound,ssi" */
> 		ret = of_node_name_eq(node, name);
> 		if (ret == 0)
> 			return name;
> 
> 		/* sub_name = "ssi" */
> 		sub_name = strchr(name, ",");
> 		ret = of_node_name_eq(node, sub_name);
> 		if (ret == 0)
> 			return sub_name;
> 
> 		return NULL;
> 	}
>

I agree that having the "try prefixed, fall back to unprefixed" rule
spelled out at multiple call sites is a consistency problem, and I'll
fix that in v6.

What I think keeps consistency, and it is to factor out
just the string operation, and have both sites build on it:

    /* "rcar_sound,ssi" -> "ssi"; "ssi" -> NULL */
    static const char *rsnd_node_name_strip_prefix(const char *name)
    {
        const char *comma = strchr(name, ',');

        return comma ? comma + 1 : NULL;
    }

Then rsnd_parse_of_node() uses it in its fallback path:

    struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv,
                                           const char *name)
    {
        struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
        struct device_node *node;
        const char *unprefixed;

        node = of_get_child_by_name(np, name);
        if (node)
            return node;

        unprefixed = rsnd_node_name_strip_prefix(name);
        if (unprefixed)
            node = of_get_child_by_name(np, unprefixed);

        return node;
    }
 
> 
> > @@ -1273,7 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
> >  	of_node_put(node);
> >  
> >  	for_each_child_of_node_scoped(np, node) {
> > -		if (!of_node_name_eq(node, RSND_NODE_DAI))
> > +		if (!of_node_name_eq(node, RSND_NODE_DAI) &&
> > +		    !of_node_name_eq(node, "dai"))
> >  			continue;
> 
> If driver is handling almost same things individually and/or randomly in per
> each places, it will eventually lose consistency.
> 
> rsnd_xx_name() can keep consistency ?
> 

and rsnd_dai_of_node() uses the same helper instead of an open-coded
"dai" literal:

    const char *alt = rsnd_node_name_strip_prefix(RSND_NODE_DAI);

    for_each_child_of_node_scoped(np, node) {
        if (!of_node_name_eq(node, RSND_NODE_DAI) &&
            (!alt || !of_node_name_eq(node, alt)))
            continue;
        ...
    }

This way the "rcar_sound," prefix convention lives in exactly one
place, and each call site keeps its natural operation (fetch vs.
compare) without redundant lookups.

Does this work for you, or would you still prefer the node-based
getter?

Regards,
--
John Madieu

