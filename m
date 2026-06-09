Return-Path: <linux-renesas-soc+bounces-33733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9tEgDYfTJ2ro2wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 10:49:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5565DF3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 10:49:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TfVi4uv5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E147D30D94D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 08:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6D83DFC68;
	Tue,  9 Jun 2026 08:42:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE33890F0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 08:42:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994550; cv=pass; b=kAcw25TkvEMreyIJuc/QkAvJElyWp6pAQ8DOSuRnNXh+eWobr1JtSW+f2UmY5ns64ggBHz4Nbn4JwsHLnjbcrG9oF3ELq+UgJVhheAK31bLTjS49tzlqSByDlbIsNIIHySUnn+MprNC+xFKQHCr3z3Hz0UYySUj1/4E0eo84dy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994550; c=relaxed/simple;
	bh=TjqNXTdYC+1KhYAgIl8HmOtUZ5YqrP5H9MzSQdXyhXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUluWiUb8Mc1mTm12i+obug0v9/4evPEirv1/7NZ5GcAiyzugrCW4RJL3GB02WHbP43LeyEA7zDyDP4UUHJTlV8ttdpLrxCcsK/nFErRR/Bj3l6TaK9jQ+CmOnUgYWnI/Fqos5eKLVtRlUnspSOcTbXg3kJuuldGM/dcJcctEPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfVi4uv5; arc=pass smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso35888805ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 01:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994547; cv=none;
        d=google.com; s=arc-20240605;
        b=CgWEMErXymtGE/k93ugk888m1T9g7mIkTTfL4iZLmFN1tNawRfbi6YlNgbPrFjvfKk
         PE+FCj+W5vcWFmMkv2MQ8Wp01bL4sV1It0E6bpBMd2CaPPM1rMi8qDX10X5Lj5aRI8gW
         CGOPI2owykuxb0SfarN3KQHj6cLY8BEpe1X6PClqx2Z7f2pdc9IvqMDnO5O2KlZchXlQ
         j1CHreWjgbm/3Z246uJntXQC3utVQbw8tBBQk5krVPBs0C+ImtEYXksKCHQBFIIL0cjM
         /1GOD2mqdUskk+v87/gfjhAmBChvdS5XmlDqSfE7j4AxQCHk9VUoMpMh4TEMSVUkMiSe
         b+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        fh=FOz9zUz6Pk+Mv4zfVNSyfGMb/7WKsg3z/sWGezB3K6g=;
        b=Qx8eEtj4X0hTid5OUeBqFqDRu+1fXsfstBgFaiC2jQ0/KB9C4ESuc6d+OLMiaFmLDT
         +SKmYV1k4eNRjlkL5wcm347wRJxGO93H1wUh/wZm5ZfH4LKGhDnYSOYyXMkNay+yvNHp
         UgU2svxHZVTsZuhrcUg5FZhTsLeKRPkCOC3iE9jYioX7MPoOBXwEtgVpFAe3qSvyH/cD
         iMyz40MTut/8ac6MMx3urXEvkaeuDOzX+LXeIKAdKNy/OMPWss4p2sp3OnhnjXihKIC1
         SBhwe14832hJB1CN3+u9r1w1oUwdsKmy5CBfnEYo98lCc5VRsTIByJU496po7jgQqqfn
         oyuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994547; x=1781599347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=TfVi4uv53H8yG2R98vcKA7AbOiAdZAaJhhL24N8bX+x82en6ezaakEsuUwPUjI3BNx
         VSAWliDQ3+1GeC3FYAJLesknwOZjU+Kw/gl9B7fU+ZRY+Kx3SQDMGq5nJMk6O2zx70K1
         JP5nHk9QbP+GOqQMnq00pk67dz+c9P7yBE7tsN2zfq9dKZr2B1s0Jhbn7ux5autJKQ2R
         JX9yxUVoLeIPotjeHwdwTwe94VqAu9WBGf5KaOH/Tcg/LuoIygCpWACCvm0oLzMhF9cw
         o09t7yNFVk7HY7WLNkmoKsIUvfqpuyEbnJRSH1qjuIa30HhSFyAGJH6Hk+i/Lf1ZSkFk
         dhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994547; x=1781599347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=bH+PUlrTIJh2D6cOzOSFnBvz34jrvihsHJRhTPX6//DdAEBZ1v1ZPYKslo9dLYPMQ4
         2XY5eMimWbpFao30yNTJ2S9Js80kdI+MUDnmMMCI+tFsOSicme2Cd7gMvL7e6oREAL+M
         gjO4Ego0hzQI/kYHVCwfgTWwxAb6ZDxnRGSd5j2y26qiGxHeOiWXrlgGx7KH8Dtt3t/1
         4dbps2DwyCbn+O/e1WGftMOQ9ymHk1ltWMj2R+WFowoYC8SfIgSdT/yfqWcOlKt33BoN
         CU8fQan+t7OCenYWsCCSWrjEM9hBnUCXfvjvO/6TXMDRoeBzg2ysOyTazgzLYccfiFm5
         BhWw==
X-Forwarded-Encrypted: i=1; AFNElJ+b3cxjqvCKa14iZg7T38jbGH30C46BrTc2Xqt8WKLLtAuVjFlTeAuwbPGh/rHrPfdN1RxW8cmnt53ScI+GjkiQBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1dETBpyKbwmBz57+yTOlwki4SBlz3Gzn816sA0DajAoRckmt
	0sZZw3sK8YyqSWDXWOqFAx2HTlYj1cnwRKUbNuU4p99hwYb9UinNPhJnikJWNqsgW5HzCZnXYmD
	NSv76PFPVq2GCC9HUs9KXeqyv3HhSRew=
X-Gm-Gg: Acq92OH33cVrx320aaWMSQG1iCZZO4/u0IfdX+5FIyi2AUQ+YfA7bUyv4sFlgVFqHov
	ztTtSuLg/MICxPRtDYpr9JWFPMmFOgH5CfNyDMsKWVqiM7OI0oaAl5UNJR8GWplnSfoC5AMdvq1
	oA0SpOA0M3BnXjncMNH2Iobfkbj/3hMEbuigqx0BEeeAVIg5WNADtdK1nb9xYnPpcKQ23hyPVdm
	zrJciagBq/FpJkSwB20DWT1FCU5ApadTF171zDGWA+Ow77u+4wL1+HjY44m0CEHrCQ53exj7Hj5
	majyyZqisJ8KxZpHjcxSSsoSAGHp88/SYYl/KvkGsK0VSXfJmlTH/IJSY9M=
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id
 d9443c01a7336-2c1e7e527bdmr221175875ad.14.1780994547276; Tue, 09 Jun 2026
 01:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
In-Reply-To: <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 15:42:15 +0700
X-Gm-Features: AVVi8CcPsj0hRF2MDcCHJjJml-KAPCz7cDMeJub82nt26AoPo4Fq3Pllieca8tM
Message-ID: <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33733-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81A5565DF3E

Hi Krzysztof,

Thank you for clarifying.

> >>> +          uniqueItems: true
> >>
> >> You don't need this, it's by default.
> >>
> >
> > Could you clarify which part you are referring to?
> > Are you referring to the "uniqueItems: true" property or another
> > constraint in this block?
>
> The uniqueItems should not be needed.
>

From my testing, if "uniqueItems: true" is removed, the schema still
accepts duplicated clock names, for example:
clock-names = "fck", "spu", "icka", "icka", "xcka", "xckb";
Since duplicate clock names are not valid, I believe
"uniqueItems: true" is still needed here to reject such cases.


> > The hardware supports several valid configurations, for example:
> >  - FSIA/FSIB slave: only fck and spu are needed.
> >  - FSI master using an internal clock: ickx and divx are used.
> >  - FSI master using an external clock: ickx and xckx are used.
> >
> > Therefore, while fck and spu are mandatory on r8a7740, the other clocks
> > depend on the selected master/slave configuration and clock source, so
> > not all of them are expected to be present in every DT.
>
> Explain that in the commit msg and be explicit that all these further
> clocks are optional.
>

Understood. I will update the commit message to clarify that
icka/b, diva/b and xcka/b are optional and depend on the selected
clock topology.

Best regards,
Phuc

