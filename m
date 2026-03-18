Return-Path: <linux-renesas-soc+bounces-29715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDzmJsFAumnMTQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:05:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B942B62D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3807304077B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 06:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A33363C7A;
	Wed, 18 Mar 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO+h2NyS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7936214A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813788; cv=pass; b=UukKhuYFeftiJrm5okpqZRnvYz1i8MnNTvYcMfZDb1TYYw/M77ZX4skC/Ik+klphgVMZTCeCJBPcm1WEdk/lnKGYqbqa81cBrS0cmWkSPa3XXT5h3fPhw/UwrP7K/+zGwTIuGfa9lFjAml+d/WaRlJe49xJWbWLKnLA8Mljyz7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813788; c=relaxed/simple;
	bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2PP888PDZG8rSn/pS0FbtX7IMzC5STRsPVpe55eLhwfsS375CUGtqj4B+aqFM+d1wuQdjt0tTpzw0HP3ly+ewlOKIIbA6ERqmV1lWZb19xIbUt73/bTXJlxvKzA1eFd7S7awYXfolN5wGJU9GIiJuw4Mx2fexrDOi0/hhu9F3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO+h2NyS; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b05fd1d147so10582395ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773813786; cv=none;
        d=google.com; s=arc-20240605;
        b=PcqvtmkKKxdlrZ8ytVN5rWy+MTDjwxEDoDBhH6DC1TFaBWZbNQAcHuzHwHpw28H/QV
         LN3GC6G5vDSfwnKocmnaNRWnaWPXd4dsgmvuFyEK0J+twvwck6DNVhp/ATqOuZHQ0+zj
         BMSjUAvfQgvBjyiJ7yFuh6oYRW9RuC4w/AwUxOGua6sXzeEdofJkK+s6yKKYz+S7xEB2
         OKzS9sacKMczzk6VzDLAOh5wM98Hn5gXhCR2BAPMK2gS/iA1kNlZV04yquS10xRHjiz8
         Q6PmLxsTQv5VOee/BGHAIxGnkg1Ej+HH0/ZsQ1p6ZnNS++CWefBz90pj2jkZIIaEDNBg
         qKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        fh=xGXguPsKgvb89not0TmTJ3xUy9GR/bnS6koLeqf/Q1E=;
        b=KSKd2Ct7ZadNfIoQ0djyKPpy/z3KJ/uSxcKrtgog3v6nTJN7/Uiru+rg47fTc+tIjy
         4A9UBXH/a+XUhB8rsY3mzRP7UeEzHa3CyKG2XO9wHlb0zA4ij7JXGXkJDWDzyqC93uqN
         0Th/5yaXHdF7/tqB7VdmwmPRIQYXttR7irOJnb6g2VPbpLiIGjQUJnd/5JM4JOfgHOmI
         dlPaczPOm4IMJDglcMe9hw7PywIElsih8Lr2ET3K228YFEITasOBkLp/NHEpJ+55w7kZ
         /88zxu0HDn8CnZbKREdvbGXZTkdy3uKcUzTp5cUcQ8iKQ0nqs4XFdhWpv8BXFiCg84m6
         OrAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773813786; x=1774418586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        b=YO+h2NyStrF/XisNXSgLUIRSRBGBuTXjlVwSPikgm1/Y1x4vxlNErSBO45iw96F/aF
         pvP7EAGZ8PUwKXYh+hNN/rfOdpQMt6PiBkzrHiwcFZTwzspluXReFwVQKKQcQxyu+zk7
         BGqxHMQkKXZ/Ji5XMi+4Q8wpf2vZndnKvMSUq7FO+Qb8OmpZJR+R03ak7SFmVBd1ShTk
         bpacuSQE0sUaBZ9No0NTYqmtONG2Sx4QemprM4hr37RVFM/+Fiw2Rcz+hP5hMLlFhseQ
         v0tRkcjlhYBU39jObZNpnnuuoJ5vc/3G14XxlkVlsVGB9UnVwFS9vcM4jH4S/I923HFS
         8GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773813786; x=1774418586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAszSs/49zboyQgDtEnHp5rVuVO4D9UBOFdQEAPpg4Y=;
        b=V1gQ274MZ/9rczck/NdAUMAPUvo/amAJ8M2UJl+6o4nVVPvHoedaI/23APG+yVUsxw
         BnwMl5wVFmp2rpcAw81D+4umfn7iFCWY9WWXX3e6NCF/pitemNW9fhVzg+voGfIlIbqL
         c3Xa7xDbF+7vLed+GzcPIOzKPIj1NCO9+/cfwBpUq3l+xtWVfA8Qva6m0S+Kua4JYPAA
         jsZmN5MkiCn4lRrQeQLKuA/Svb0N5pIO1sDwpCes1kxN7qQb+Ot3ZgJgQ4CUv9jr4eRW
         +H7I5ulfQnZNNc70fOtFnYaipXIo7l1vLUKHDUtTx3vtFbCrSC4/KgUJQ1LE/DDPPlwY
         5rsw==
X-Forwarded-Encrypted: i=1; AJvYcCX1QmKsj3edr432qcZQJWAVYuDznv+kAkEel8gwmsGTmmqShB5aUF7QVJKFYr0ro1dMfElXPxBCgme+Lg/iScShUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlsvvPd9cHN51OENyXGIBS2vWEj6QfpKShE7Bg98VbLWeBSUTI
	+mXFrL+O1Hs209FBO+b0pnGuX/xDesJd3r3RKWe75F1wZoQU/7yNHH4GhjzhMoOH0re2xGeFa3s
	4aYnsED7CHRVkFqSe8OJt51wryhAt/KQ=
X-Gm-Gg: ATEYQzyh0kmjkvQ1XIdYnOscIZmiiogrF8fqploBO4M9Hq6QnUoxaXgF/QQrVEZjRME
	3NccaxgGYKOZwH3AVwO+ci5d/PrROgeGjRKpOgkYbY/zqFOqBla3JG7OPEuoJBdbdIulr+2Ru3K
	HZ9R4J+TrSnELpQHawHP8i46KebywvwupH/kq2zKgtRrFhnzxGp1Bie0bNVsSGkY8httRKe25mk
	S9YPIljWlpOnsWwnJgdeCRW20+976nIvSeiNpu2MH8OjfTP3QRvYHCRkfNHRnzlEDrULyTnp5OH
	6zF//VemG3OnM/hVe8wNrMkli+lmFeLBDCV+EQ==
X-Received: by 2002:a17:903:4b43:b0:2b0:6d2d:f1d7 with SMTP id
 d9443c01a7336-2b06e42bcb5mr23101165ad.48.1773813786487; Tue, 17 Mar 2026
 23:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
 <20260311043831.2576-1-phucduc.bui@gmail.com> <TY6PR01MB17377BF5B5B59022FB39AEA12FF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB17377BF5B5B59022FB39AEA12FF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 18 Mar 2026 13:02:55 +0700
X-Gm-Features: AaiRm50Lyrt6jaVx-jDOI8ZexNpt-ne3CL_yu9V8PgLR4hVEocE_OODjZBPtK7w
Message-ID: <CAABR9nHZsnsEVcsb08YLaZKL_ofBkKhqGyLSdH65Vh-2we8O2g@mail.gmail.com>
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29715-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[google.com,bp.renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aka.ms:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 07B942B62D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

> Thanks for pointing it out. As per Biju's comment, there is a missing
> -hog at the end of node name. Thus, if we keep the schema-friendly node
> name 'pcie-clkreq-n-hog', then 'line-name =3D "pcie_clkreq_n";' can still
> be useful.

Thanks for the clarification, that makes sense.

Regarding the line-name property, I'd like to see what the maintainers thin=
k
about this direction. I also noticed that the usage of line-name across exi=
sting
Renesas DTS files are somewhat inconsistent. If the maintainer approves you=
r
suggested approach, I will follow it and include the line-name in my next p=
atch.

By the way, are you the author of the renowned books such as "Linux Device
Driver Development" and "Mastering Linux Device Driver Development"?

Best Regards,
Phuc

On Wed, Mar 18, 2026 at 6:31=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Phuc,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: phucduc.bui@gmail.com <phucduc.bui@gmail.com>
> > Sent: Wednesday, March 11, 2026 5:39 AM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> >
> > [You don't often get email from phucduc.bui@gmail.com. Learn why this i=
s
> > important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > I noticed that for gpio-hog nodes, the kernel already uses the node nam=
e
> > as the default label in /sys/kernel/debug/gpio if line-name is missing.
> > Since the node name here is already pcie-clkreq-n, the line-name proper=
ty
> > seems redundant. Should we remove it to keep the DTS more concise?
> >
>
> Thanks for pointing it out. As per Biju's comment, there is a missing
> -hog at the end of node name. Thus, if we keep the schema-friendly node
> name 'pcie-clkreq-n-hog', then 'line-name =3D "pcie_clkreq_n";' can still
> be useful.
>
> Regards,
> John
>
>
> > Best regards,
> > Phuc

