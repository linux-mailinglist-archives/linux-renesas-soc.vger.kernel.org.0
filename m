Return-Path: <linux-renesas-soc+bounces-31371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFooC86J4mlq7AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 21:28:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B739441E3FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 21:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EB3F30F2A7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 19:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE83CD8A1;
	Fri, 17 Apr 2026 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OK/piPGC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOIoLwjL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF623B9D89
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454027; cv=pass; b=Chb46Xyjsn7dec/uWJLk3nzAWMqWNyzcAyFDf/oFtFRiHMQsmWzDb4Ss8YvjbLBz0XNJtTryguS7vLAIMT9TM+xs+QdxJa7YSaDnOV+Fuc/vyX9PS1fdIVUVlV79lOvQAdCryUUcjc8NecB5mpiSW/IN169300mud71vVop5NRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454027; c=relaxed/simple;
	bh=lPIb5aQwmaxS2M4Elhy58rbK4i0LOeCmLE2r+D3C9dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8/MPb0XQfpyrnMDvkHPJhBTtPj9HTNFuD1yqlIf+LbtwPpHeXbPQToc6I/igqgDdn6d/ge9zxHRmCdpENbh5L/jgQtRDmjMpUkOjidAhMWVNmDZgSZOGO0RTHE5Zi8P+lUS6DgbI0iw6tarT5SyBtR9z1CoIyDZ1yklqDC08gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OK/piPGC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aOIoLwjL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776454025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
	b=OK/piPGCyQLqJNM6GJ1K6DT8Odg8dBK4z2v8cCQUNrDHoMIGzpayj/VspGF2uta2CFovWJ
	TmWkshVGpc1FVtMefHNV31bLinUJRvipfvK13A0mlKQtM3MsXL55Fra07NJcdYw6tOR3KU
	Q8qs0+LK7YW2bOubJYo0Lfzf6+S8KBI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-S9UswuwYM9Gd8jsieGbnSA-1; Fri, 17 Apr 2026 15:27:03 -0400
X-MC-Unique: S9UswuwYM9Gd8jsieGbnSA-1
X-Mimecast-MFC-AGG-ID: S9UswuwYM9Gd8jsieGbnSA_1776454023
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b9c5f899463so137481166b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 12:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776454022; cv=none;
        d=google.com; s=arc-20240605;
        b=cp6U4PCpfFXq/kMHvyAmvSEicX+LDJcygWFVkQMTkZ/rt7o0SDSfLJrCf+BSMjmDBM
         D4Gh1BpZ2FdDZSRb4h4Hoio75+TG0K5Q5a1gvclzrPLIL3QaWGhsYDdMv+AZ1fQXxTPZ
         8yNDFykTaNvPefCsBqWbOAmhOgda16iCoBDSn5KX5KjZXm93MY4FxEkWVYY2Xs/FIOGo
         G4MJA3KshWsJbR3T/6a817eFKKFQeM3sw7K+J5ic9Bpu9AsFR5R1PzNUAPfam4WZUtKs
         FWjUE1hwM6TYVy/XplTqIRvXERsT10JpBDEsx51oY4J7xVg1K6DXRVdi4qfsXLtAoHEL
         YM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        fh=aOG/5vBaIXihSAsuS64p/p2mEotsqBSlBd3gNHRAHBc=;
        b=FWocsi4msE3jiIfhDAUwPx7oLBAFIGKxEbe1P4tcgExY8DOmhfqTNym7bh02+bcgOd
         y1ADlq5b/yCG2d432XBAwksEbiYatoUPNClZz0yrslqxnIofogvzLJAzQ95//f9LEG4q
         CkL/sIInawj0xr8DhDq5ASALvXZ2vRZqkwb9QYWn94YVn6DeOOOLc9uwpC7J2e3RL96o
         OEv/xd9Bdyh2FNhsd8QAlrCGvDjlkvZUsmcNoZ6xZ8w2ezNYJTr2m+OBq7oGCyiEk6Py
         TjYodns1M1ZyPBuWT10yZ7v8unsgdku+/CExKiF7nl1uK08B3ub41CB4t9YW3zkk5049
         FwpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776454022; x=1777058822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        b=aOIoLwjLdefwLZ3QJi2APWZKvkAxgGsyT4IfIZ4JdzeoXtKnLXaFSBa4Z7XCgYtCap
         1LQxRLBVphtSkfHi8uol3Vdh2v+heaCIKkYq9AkshdC0IKOzCeD8G/cq42w1KuMKZJ7h
         tZtsAIYKJidVxlO62jfQac8iYMdYP2jiDY6tPz+IuX6+e0FIAGQZYVx5VZDzFTaSia1J
         WXLdls7HvLpYMMXlpcRC2HSs+pOi9GUJIjFW4vfj3YYfvPLML8pfACheLCr5gZhz1Ro9
         8Xk6TU1c9rx6GfbTwoyCHnsDbyWJ6ig5UvnAQSDRdSkSbxzqkg3De26BpyTh1Z7z0UMx
         aMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776454022; x=1777058822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        b=rTahfQQMfr1hehodkYinwcTjjzex/tEUxNlLFir8icrlPIv82jWbWdMh8Kkv2V5FPw
         9qVijaYhGLeC9omGJjuaJS1kn0wjQGQmID4hQVLRpIcDSBp0Ar2Z82GnXSAe428wa57z
         fmiqz+hauTithiIfYIhb3N+JeWQx3f/zhBtEHNY1AcRgk4Ui2euy+Rp8uEwsLcXZNOrx
         Si5KFnUS5K/aURXOXeoTj3FI/XA5aN0dU1POvMGV+A/NFggyVuCoeZWzvnrYq+nBO7Kx
         0OCCgoRF8HAx3Tc33hPJluFQP/JCq8mGwq5LwGGHjYm/wx3CxPoRETvQgKQUsWUGbjtx
         Acsw==
X-Forwarded-Encrypted: i=1; AFNElJ8M845ZsJO3+R3xtT+/OpsqPs1Ya3cztQHc/JZTiAyHRjuzS/FFnnOHIKkm2xjjLHFdvmJCva+X8gs/VOaAToHqPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlgx1IBN4ZMdQXxQseVuX/UKDNxopRcQtm85fPgV/EedMGl37s
	WQWvhpjwVnPtswgA3Fh6I6XVXUpWTCY3cJgnJB432zM+T9W4jt1GAV05GAPokLTNOdrQtHI2fy6
	8or5pDMXm5uVuGcVveYBT4tL3DmyjDLNbu5oO/DZkSziEJ3RvB6TrWrBFJwvKi4+BSEzZK9CzfE
	v7DI6Nb5tOGEGazX7YEzZueIFZPIMjh+Jefr7/X2AdjYT+VN0=
X-Gm-Gg: AeBDieuvfEEt8Y65zWJS0mAeceMsVPIbSs5efiQCKncRs9Ztf7qieG3s7asl2G/BYKb
	HH/zwg0YyJK1vlt8gz1QX5IS4SLqxyreVsXW9fgL4HILMU7otZTxaGht/7uDEqybCM3YE+HaRIq
	Y3pbHSGu6pY1hBE0p5WufiCIDxe4HQGJUmayVZsQSMPfdyOJRJGw3seufEYsdlGY41QnmTbGNDj
	R517aaYyDL/63+0
X-Received: by 2002:a17:906:730b:b0:ba3:4d60:c4d8 with SMTP id a640c23a62f3a-ba4229d76famr206699266b.28.1776454022488;
        Fri, 17 Apr 2026 12:27:02 -0700 (PDT)
X-Received: by 2002:a17:906:730b:b0:ba3:4d60:c4d8 with SMTP id
 a640c23a62f3a-ba4229d76famr206697866b.28.1776454022023; Fri, 17 Apr 2026
 12:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aeFWGYaRownx1jdp@redhat.com> <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
 <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Apr 2026 15:26:50 -0400
X-Gm-Features: AQROBzAXbbZNFmEuYKflcv629Y-xUj8FOG7iLNZNIU7O46akxJ0PW-D7cTFcBVA
Message-ID: <CABx5tq+tyZGwDNES0dk8NrsWU8nk6GHC8gAr8xJPzcsVELp00w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31371-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B739441E3FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 12:15=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Apr 17, 2026 at 2:21=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > > On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > +     /*
> > > > +      * ULONG_MAX is the canonical way to probe the maximum rate a=
 clock
> > > > +      * can produce. With a parent at 1 GHz and the smallest table=
 divider
> > > > +      * being 2, the expected maximum is 500 MHz.
> > > > +      *
> > > > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), th=
e
> > > > +      * minimum rate, because the search loop was bypassed entirel=
y.
> > >
> > > The "Before the fix" comment should go in the commit log. The comment=
 in
> > > the code should describe how the code is right now.
> >
> > To demonstrate the existing issue, you could structure your series by:
> >
> > - Introduce the test as the first patch and have it show the issue and
> > the current behavior.
> > - Put the divider fix in, and update the test for the new behavior.
> >
> Sure to confirm,
>
> patch #1,  have KUNIT_EXPECT_EQ() with a false positive.
> Patch #2: Clock divider fix + updated KUNIT_EXPECT_EQ() with correct
> expected values.

Yes, sounds good.

Hopefully the kunit change in the second patch is minimal. The issue
with having the kunit change for the fix in another patch is that
it'll break the tests if git bisect is used.

Brian


