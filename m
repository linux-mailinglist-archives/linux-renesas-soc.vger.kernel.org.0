Return-Path: <linux-renesas-soc+bounces-33737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rn2aNhDkJ2qe4AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:59:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55365EA41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KBbM86Ky;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4B42318C849
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56163F5BC7;
	Tue,  9 Jun 2026 09:49:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7D3F58D9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:49:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998586; cv=pass; b=l3QRADuZN8v//Dub4iDk7zcQxvk93giISKA9au5ZWx9h9J4N3tm5qZu9U709cXp+pPpzo0qoa11sndg9VqFywXUK6MzROIGCL+YEmSpECsnJ2N9hmMKbyhuYXHmRV1ocB4JhOt7JfrZ3wR8WWhsx8k9FUzpOYCTg40FnworC9WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998586; c=relaxed/simple;
	bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ca337mC6wedoeBpLKbY3rMsqR2QrVBt6gaJPIibW/ax1L5gsgesNZO4/ZGzmAzuEtsJjlvhl/UcXkPdCXrU3aUS5MGx0yK4FxMhjWMvulVREpjXeimNx3XaWj2Jun+v16nlgNmCueMVe2brmbWjt3cEKYhqT07L+S7leOPsMIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBbM86Ky; arc=pass smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf36a6905cso37161615ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998585; cv=none;
        d=google.com; s=arc-20240605;
        b=QHO248HPnJH7oXrA4jiK+ptBLLYFWf4VEqqbxsHVfqS+sl/7Bh69Jhz3x1OvvWwNpb
         jiMM8KQFqzFoHrcfqSlsireia6zPcQUsF2xVqLmB9Ooy6x6wnVcNCLApiZMEvFRwxTpo
         4msoha6dWApFccMIlXMt2BvCJY8Q/AtN9Z1r2jAN/T+Dpy+wZbd5ouqnw8JLDgqe9CRb
         PLwVjUpY9P3vMHVbrEgKwSj1noJSMAqPZNvfa2M05dGS1U2i2ydvbvFq8/yG5Nv5yuZr
         IBA/Wuf7j7t0HcTldNUzqq3Xc2+tUdnDrHKwhElQuDsVmy+KKpCiFYeI0qF5fY1+A3I6
         5vWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        fh=Nh0ZlB/bBPzDb4oSenhUTsrlltc2Iyjx+oU7xMkrWxc=;
        b=ba6IPtkrVI8mW3fxpRCDtKjcCt/PV/cW3B5S0VDz15bq0Zvx2FQgQ2b+ZzY0i+jhyb
         TZonZQ9iQxFyQBNruYDeI0yTizRSqp0B18G1hWZtsvAPZO8po0J/ScX5XaZ9tIKq/154
         orMXhVHrhOaWaPQ9ssWhejmeIPcslEC8IbkedaivE/ZuifHUdX6vQLeTsaSksBJkYPOC
         iFYcZShrDkkwM0+Rh0xSuz4Xq2mxQjJUDHz7Ieii+rIeKZVevUvKQicsbO0IhKmoGYXI
         A+JzYo6zkiovLeUSLMXeIPrzciDW5xlW0DCzaEqvNy1GzP/eSqKFIvWtPheinlzi+f0V
         T7Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998585; x=1781603385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=KBbM86KyF2nfp2WA+02JDxIwb2euc7XguaPtK77tXmF9Yq6PJNheOBy2xScKCQ5Vx2
         X717y9ajvuSaCM1XXHpbajuPyGRwckuWfseGBmzsnunmD/b9WdFLVzUBCRa7y9Kx76f3
         ehCjBI5X3OPQ0vyKWxliXWwqltJyFfe1JGwhnw3EcZXvGSjTBrf/BrS/ORpkrEexRJ3Z
         Ity9ZSfWAoiOwD7S2LnFisB+SF46EgFv+XGMqdlF2Tfg2YD05dVmYdFFUudH8V+SrOP8
         ABwfr4KvR8ffng2RGQGb4ojAorVJGCAbtOtT47lzEX3IA7M0kx0tn7GSWS9OkiSQPLBR
         ePiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998585; x=1781603385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=FYzdeYcQwOQiz5x5IeWPG5lJ42E3Wjg7lchQI24nJXyvSjraUS4QyPonu0MODpVjE9
         ulaNXUAijiBb1+OMiEOZsnXPyAKqgHUKoAcFeWD4Rml4sdZQfKkgwWBZ+rDZgtDizLzp
         tyvNLFxjkVVUyYuAKQxECMtkDodFBQeOKEFKZNEDKFLLsI/F4LqaV3TSjQGip/lDSvFG
         bKxAopDIIbiGm9ej7CHgkvHbLxtItz5d8aOL8GqDW+jm1GFjy3SU1WNkEOxwBlA7k9Wf
         VBUH8MiXXKLhnn0s9uRz+90/Vz9JPzNNrZNnrv77g7TDW81CvSnk5SizIvh8FrBD8ZPn
         v6Kg==
X-Forwarded-Encrypted: i=1; AFNElJ/psF3i6qnJr2h/FbJG4cRtoxcmfCVsPSv294IjDfXN8ARrgtGbEhKfYP1YAyIlarCr9zgtC+090+YoN89QlFPcUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6EIIeBMssJh1QyjRCvvIx37gIakVKBihdUvHRDsE9iKaIPpUt
	BwOM/mtWYUzVUfyrRnw7eCwf9it66JvRg7hi4PbqjKHGbrwssHqVVydnXvGEBXFsvFt1oryHhZ8
	SFjZdQYgXAZDD6bV/y/iCxy14RRZC8cY=
X-Gm-Gg: Acq92OFvykQ8c3/2nafrnmEXxSMzUQhu9kw3s/EPNPEz4IhCsLTbXQMie8/sTb4NwUe
	0YiQdvBRb6sY3W5VS8wzUK+bgRL/yAk8RrPV07Po3yxjTbOB6AS3gspWIXK++2ir7TkJiXG69kz
	7X0o3Sx3tpFG8+WrSsnzNAFHxM9px59iK5Nqh276U9y2+bV8bWNXT5RhjCz12J847EzyO3CmVzJ
	s7TZv80VW1l8siu71GBRUD64ke2yK1foREqEd5FN5p6gvXPNSGF/leKRtOsFlm6VeCF6lDLb3YZ
	IdL6b7SU9yjoK7nrspZxpW3qplOCpf45ZAyVM3vuvQnorvlWobtmaEoF+j0=
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id
 d9443c01a7336-2c2a19b70c4mr29256975ad.0.1780998584740; Tue, 09 Jun 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:49:33 +0700
X-Gm-Features: AVVi8CdljbTt5iumVzeCFBObBOG-VUOn8HWf8RQUwP6hql8FD7Nvhkr27Hm_R2E
Message-ID: <CAABR9nGTi_Sc4Rn_Prg-cv0OeQkR_qjvaFPZAH8hf3JSCF-yZg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33737-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B55365EA41

Hi Morimoto-san,

> For all patches (except DT)
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>

Thank you very much for your review and Acked-by.
I will send a v6 shortly to update the commit message for the DT binding
patch based on Krzysztof's feedback. I also have a few small updates for
patches 8 and 11 to address comments from the Sashiko review.
Thank you again for your help and guidance.

Best regards,
Phuc

