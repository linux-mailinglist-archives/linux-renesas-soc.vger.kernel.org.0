Return-Path: <linux-renesas-soc+bounces-27017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 702FED399AF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 21:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53B343007282
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 20:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68013009E4;
	Sun, 18 Jan 2026 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7GvZW0o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB22F533E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jan 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768767780; cv=pass; b=KDnu83rEIvClWlDcJ9GP9tQuBHlHMyqRj4Mi384aCEwkipVxu0FEv7mxL6DjPETY+aTt5QN8DRIVG0o4Bp+ZfnXjO0cM7TfworonbNF7cxYfNrOzoP9jDoJ641auZ4XxMAQV2vl5CtZudiKVXHr5aszg5L4FWHuzCzguWe5N10Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768767780; c=relaxed/simple;
	bh=Xs4ESlb7Zdq9CXFXCc6KRL0lwZPoCS1UgCVuCslzQ2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIaON5JZSQJdp1Jci+ZKQkVMr9xaHO74N+PxeHEqZJG2p2rtgwmsGFWHGMr9emdfvgs2Sgl/30DHsH3fPKEHJGI6H8t5AM/89dJFOIDyS3YAaJgY2N6IWI01iBbUHpZWcAJMqMqjmk44yHFJ7Fc3sATRLWNBVN3el+UynmM5gmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7GvZW0o; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45ca0d06eddso1490640b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jan 2026 12:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768767777; cv=none;
        d=google.com; s=arc-20240605;
        b=RCJUiZF0bQiaI3ExFKHqUQoTFpqpGv6O+XeldxkgMhjU+yRjcrwH70YmmEIqRdb8h/
         YVW9odrMZW5uOA9bxN63VWXCxEs2vJIsvn6D0KJSVnV5XpdxOufjJPdaGYNJCm8MAdi6
         O8XEmzGaoGR/8Hh2YBB/NguTVrpg3YHhqtbAxk1/aGtaXQJ+KPODfrc/fAvkflQC7cIT
         /GGY2K8z8EjzFSmKeNxJt5oBVu5y2EhXpxizWl31KMfpczLBjuJ2sAPTraPjm130+0+Y
         AhOi8s/J/YEztMFMfuSL6Tq2XKtXEu8jn+oVj93HkZjwJZgm3FRiXQd58vDj6Tro2ORm
         2Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXHlbS4DlpUMvr0r6REpatsLJ8Rf1gJh1GmrVBDqQ+g=;
        fh=xgsM6Bov47pAA3lDGx27xELuGuezPM18GAPvfKxehrM=;
        b=aj9BQebwjbz2YbKs/vtQO9FycZf1X5t7aCVZ+B+3hReo+h5FVpD+W3TBu21oJ4jFOP
         JHOCtZEpaYHqTFMmGKyNSCaMnMXgZdDOLntrqD7DVZLAcCe1Cfn9syZNoYfq7K8l/678
         3Q5C96P5NQAlFa0UyAX6lkX4JG9hVSdCvA8k/anK8Sku7BvZhwLaBuwUEqqpyrpwPsIc
         EB32fvqN+mau9YguYi6tjPYhv/rO/R0t8XNPLPaMXFUgkoSgaO+VoyCQ4/Qtn3OtBdsx
         YDNKgBK654tAoJ5rlIXNUn5r6dmRzYv73ZnWUcMcqutGPGtdJ25Lkqsv5Q8q8xnELLtz
         FOpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768767777; x=1769372577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXHlbS4DlpUMvr0r6REpatsLJ8Rf1gJh1GmrVBDqQ+g=;
        b=h7GvZW0oM9SAQEzSDA4pGufMjuLTv99cCv03PdvworXhBuY19aKrwDHdCeBH6qngQ3
         Ii+YtgzksJTS5PkpL8HNyzXTb3Tp0/nlQN64G0BYfejCoVavNPC8ajxks+cEbQvrH+Q+
         Jv/R9UPaPfjZVL8ubtDLvY1CUWCrISLxEZISqaVN4xGFKnROMas0UeAT8Rg0uCblxjm9
         uc3frZsS2KuxTzTAl7/w57GM3GZ/bXO2rm4UXv2SC5jCuZa/JzXLw8yu+XdGBsJeqweS
         oC7/2Xdx1iq8LFemacIrulxpVRWeOT01EjJsTWdnGuC5M0HcltqjHbesaQupN1mgvp56
         rpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768767777; x=1769372577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXHlbS4DlpUMvr0r6REpatsLJ8Rf1gJh1GmrVBDqQ+g=;
        b=uCTMNKxDIu+5EbLGa5qRZDcv2rA4PVovllCqPHiT9ChhFRHEdeGSpXku9ygcJkuXkE
         Zizu1iueDfQiplXGU/QOEFLB3Wja9HgvHNJlNv786p8e6HURVQVQ6JlnflthPuFJ3Hri
         BOshdvYrcdeQDgk2ZsbUXvuOYNxqtKAJ7f7xjAOedpEQ4l2m8l/id+oqKPNy5PFWJDNm
         4UUIs4o7NIen+ObGeN318M3AwD3+QE1r6EFX3iChCfWBgz9P3MzT/g+QNApe3NJCPu2J
         PivlS046zxTn8llad3doLazp7JlMXVKfrWPWr8nSBuNrnSavH7QTgL/kjPQlfH5AUTHJ
         qhZA==
X-Forwarded-Encrypted: i=1; AJvYcCXKVAO6ZhankF3PmErgRz2YI16B5RpfTkCD784erdx2H45Ppr1dj0DtBV6sG0wPIcfCJRc0QP6jQG4oXJ/lubfCKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38poVgYNQwa7fZhVS4BVe8xligHESurqbRFi3up3cOECtTMEV
	ZTceDX5SwtYKiZNWkcVw/Rmmbi62NQ7QsBwnLiKKpEzHvTplHfhBLe1jT1Dwr6MOmo511jTF/X5
	z3AR5HngFuxROno998TisZJzrqMCDllQ=
X-Gm-Gg: AY/fxX7CE88lmHt0tqKGdPHJG3wcjLeMD3teK1RqQHURbKJwQZ//a1ncHGpukI2YKYV
	fXEkSQBmDvB3RvDKnZQHycYGaRz7I9izCsz6ala3yUwLoHyH0gdIpOxgZ9qD7/a5znHaltVWRGk
	WvuwFhb1WMYoDEYzMUJ/zbsCIzbr70xm9wMtlRrgdfe25btAXKEqqLEXDzICwh1DHlowIB6qHm7
	UhgjEV4bvGtkaZGWAuC2XQtk7+xPQx9d3D133bdm8WIpAk6/10kVujWiYH3eEJtP3nwBeQe
X-Received: by 2002:a05:6808:318c:b0:45c:9a62:91fc with SMTP id
 5614622812f47-45c9c1d5d5emr4670382b6e.67.1768767776953; Sun, 18 Jan 2026
 12:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com> <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
 <87eco3aa7x.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eco3aa7x.wl-kuninori.morimoto.gx@renesas.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:22:45 -0600
X-Gm-Features: AZwV_QgokVPvWwIb5AzILNY7C27rOJPona5om7G6qvlydKkJ31lGUPbnmB4ycJs
Message-ID: <CABb+yY22iNJZBrFOHNxKtEOvt31B-DYZmyn-6-FOync6yOQV5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux-DT <devicetree@vger.kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 5:52=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob, Jassi, Wolfram
>
> > > Add Renesas MFIS mailbox driver for R8A78000 (X5H)
> > >
> > > Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
> > > Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >  drivers/mailbox/Kconfig             |   9 ++
> > >  drivers/mailbox/Makefile            |   2 +
> > >  drivers/mailbox/rcar-mfis-mailbox.c | 168 ++++++++++++++++++++++++++=
++
> > >  3 files changed, 179 insertions(+)
> > >  create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c
> >
> > Seems this was applied even though there were review comments on the
> > driver and binding (affecting the driver)? And the binding was not
> > applied, so now there's a new undocumented compatible.
>
> Thank you for pointing this.
> I have also thought that v2 patch-set was ignored/rejected because it got
> many reviews...
>
> After posting v2, I have talked with Renesas member and now we are thinki=
ng
> that this driver style should be changed/updated to based on MFD driver.
> Wolfram is developping it now.
> So I will post new version/style of it.
>
Ok, dropped from the mailbox tree.
thanks

