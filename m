Return-Path: <linux-renesas-soc+bounces-33653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LLS/G2SkJmqRaQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:15:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E10EF6558FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aJ7SR+kp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12C2130A5E7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D1333F374;
	Mon,  8 Jun 2026 11:01:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2663346BE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 11:01:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916517; cv=pass; b=eJUB3+0IBi/RlAAIBXhfBIYfKtFfJXSe86fKjIDa0AJPN4Ezud6v1LXjxY7NQnaTz6APXoyc5l0srfDdpYLnB8o9vuatA5KdG9GR1dIEB+NK16XV6vM4Pq9Ncyvy8dwRGFShOWQad1xdD43hvDqJynkzxp0JAyBN4e5wBF1TEfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916517; c=relaxed/simple;
	bh=ONm94510NvE+rTU8noOpilGgyC63W9CbOfLvEbHcUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+7O8pGHIWKsfqK7HQ5dxAkLh4Ih4oB49nIW0SQiFV+TFhb2fNcvYRy7JPUikvvELphPn3AuqBDzlmmWvJhMRD3ySTy2K45hRB7SCIXlzpKdN1SnLcseRwmm66odKoeBbWl7rI0+wt9sG6GAWEd1dlAnp4iPxMz555PRRkWGTbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ7SR+kp; arc=pass smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f420455so1675206b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 04:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780916516; cv=none;
        d=google.com; s=arc-20240605;
        b=VSlzfNeLS8d/wtU2coYu3ucNHvFEvq39lt5mHNu+2WDBo3e4yB9Mk1R/k/AgnKJ1Bv
         TgNqvDL9XDfzsCFCbjiSORg09y2Bsg5x1afg3mVmtIppByNQ9dfi3+HqTZM9cK7cYly0
         ukwgQnQdun4fmfjq9ef5ZXr+tPd/DxztVYEPjg8GptknJxFJETqVgTtr52QTy8E3crwA
         aXFYx+/dXB9/QkRnmjwQDCkf4NP8uw5PGMoIzEbDnz1QTPsYVI+cscEbkfGl5vvx0r+/
         TQ4BFtyLQQkrdwN8TPODOUoIh1z6KmxlkC72Tej+J04jJSek6dxxNTyzrljIi/gsdqJS
         QzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        fh=WJoyU3Cluzng04AkD4rASWFBlz8YVNPw8LMXZHXGxz4=;
        b=EPAX/vlxqP0eziCu4y0106BMVLgN7T/31elDHC5b/eWM+ZTkS99vSL1GDuJpKm30JQ
         acmB/PpH3nSQ+7l9FwtuYMjPgCwO+gP3Or35ftwjy1aMW5VfsFIi4LmmBEWECfu3iEat
         AWm3C6b+hMUoQdiuCFppXScSIYS28hqGYo4k8+ThyRdmWeu/CB/SZHno/pvSf5G42/Aj
         8JqMJ2Nrx+Tn9WVmD8DyjrRdsgTLk0HRQ1TbGMYiopm1XGkmT2bMjsP0eT1UPpLPgM1I
         VjQKNdDam3DGHAkZqb1l0jHxDz7xrvTx+9UA4WYFYwYe6mD8lxHtWpZy5Cscy2TaEZ4V
         k39g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780916516; x=1781521316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=aJ7SR+kpKlnNp4avZNM+O6GCA4unLNAJio5XAehXMdoLsi+KxK+2tUMW+hAo8qi8UV
         TJ6h7vYjoEkPyDzhE84JdK7yyrjV3GvKZD0U2AZLTdkOWyfD2S9k9TOU0vp4IHiZLLOC
         +J8mTwU+jvB8I8w9jObrs2Tn7ti6HNlZT+lyKr53Sbjj09GF1G76PmXguWzezLjqRPb0
         5w/BN3M9OAZCdkWkk7FrmaGiVh2xzByuleGlOMHejjKS9tjuTHru/W8t4/eCwZylzMd2
         sBpAjwHotk1ht2A66Jd0YwdHSXshAYaG5mJT3NkUYWay5AKOZdga8QH2XnYHVQ6bjNBJ
         HQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780916516; x=1781521316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=c8jgG8RD2Y1wtaRmL8CKcdzCamQmv6gghvngvDdShCzFMPwVoiefvObRNbh1yiClqL
         3eJs3Roytk0VzNEKimWk5KBtwAOnFPkGcRuzbbwKtZg9ku/wikD/4WhYX2rpooxhszfY
         aloWH4EBquhIbkUyXIlZKO9vNZ8DfIfEhpMlXOFIfG7w2VhBNUTxASqN8cdQhtNDEI/r
         ahnXRmPHDV66A7f6Tnj51/DkXmInJNmvd9x0LsyVGgN0MZk7c5h7DJ+nNK7vtSlhhv+a
         Yo/IfP8MMf+cqmoPe5g4YMustGux7WlSUJ5pTIpwxOAKO5Z4jKhQPxxdOFlW/pEld8pd
         R7uw==
X-Forwarded-Encrypted: i=1; AFNElJ8gff9+WzGzlOiPyPuPBU+nOGuLVLNGEokUZfz28G6xCY1KhByYDzhNH8kjcQgrjFE25FFK8yRO/IZJE77/eCu3CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHeSgbbEaMI3WjxuUbtbH7vTOpfsLEtlcdOfj8q+AA1asbP7u
	kKIzoXetfhmRxsJirmo7Enueg52vig7VomE6wWhUUNTKCIGetr8q+AlJxffnPEJOsUq+7I0xSY/
	VPayd5BYrSpd+rFfNkuxBd7nwDzYwMk4=
X-Gm-Gg: Acq92OEeowIZqlIuhKZZKtaLbEsnx5DOpWce3JtJWEf50lobHE5tFtvtGhYH0+zEcA2
	pbw0me3re49sT7N9+OUJt3YZTimameZb99o1N4Wd3WaSkgr/tSmIoAkrYbuH8/vEkSraRTbKKiU
	kxy2GVxFnaKOIaSpeF6WkEelLaKUBqS3d8BaOSFO2MQllGNJ6xT0haeCaBadO912raSXoLABIVT
	rtkCOJvMpGM89D83gPnOhg8u/nfVw2sN7BRf7SBtD3rPNjMQXpEKikULD8aeEm++JVyVzFOwc6U
	aC43AXWzOs2shlJuRxOaAnFnZSk71LUEfGNY9IyWkdsyjLGn
X-Received: by 2002:a05:6a00:4098:b0:842:38c7:9925 with SMTP id
 d2e1a72fcca58-842b0e3367emr15279810b3a.2.1780916516054; Mon, 08 Jun 2026
 04:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-9-phucduc.bui@gmail.com> <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 8 Jun 2026 18:01:44 +0700
X-Gm-Features: AVVi8CedRoipr9OOnup0ZkfX76Kd7vpaIrvqocnniiuTgV7U4RTC5IPNi4Uv0W4
Message-ID: <CAABR9nExkENpP17sMxOeCLA288kU24ftvDBmXC6ox0wdo6+6Yg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33653-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E10EF6558FC

Hi Morimoto-san,

Thank you for the review.

> In my understanding,
>
>         [07/10] patch
> (A)      - devm_clk_get() -> devm_clk_get_optional()
> (B)      - use dev_err_probe()
>
>         [08/10] patch
> (C)      - add clk_spu
> (D)      - call fsi_clk_init() from probe()
>
> I think...
>         (A) should be 1 patch
>         (B) and (D) can be merged into 1 patch
>         (C) should be 1 patch

I understand your suggestion regarding the patch split and will
rework the series accordingly. I will send the next version soon.

Thank you for your help !

Best regards,
Phuc

