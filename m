Return-Path: <linux-renesas-soc+bounces-27403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCvgN5Y3d2nhdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:44:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2C8626E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E433B30038FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 09:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC5032AAB2;
	Mon, 26 Jan 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8K6W6kN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491DA314B87
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420691; cv=pass; b=byGpvc8YhXaWGh2I0kysHYt7YgsatjHwwxURDKr0dPbsHeNrB5g0tUzo6XlLyhtJykNSHyJV/XQHgHqb5mz8EmAHiUwIFCD4UDqWy9fOWAKQahGcRpTLM0sRwWBOCnrYu0dXhwywv6u83NAsKFMaVeMTkbHUur/IrnHfUoh4M5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420691; c=relaxed/simple;
	bh=nhGT/HQ1K3bK8TPssIGqP1JnnpOAhb4uN9EYdGCGT1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdHQDzj38onaArrxbmzBRyd14K3Na6rBcG7qvgd9aWrBFAW4J6Nyyse5dolWSTysTlUYSCyqKDKviduZm3S94d5TUtZmJyz+VBEMzV0+X3sAkLVy/xciY6+kJLvzbVBDJqxSMMkGuRejoNnTGojZCjBGJdK+v+MFJ/c1NgH06ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8K6W6kN; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432da746749so2246556f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 01:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769420689; cv=none;
        d=google.com; s=arc-20240605;
        b=UfWQQLcYe1wpbXV3043yjExzb6A7uYoXIIVfollUWV6MQ5sJoaxNcOPymorV0FMZaw
         uA2AxG+oCaC8M1OPQnRwM753GiyvpJqfcXVy5JfPFQSM4UL2GCoT2NHPgLuo06neiqcl
         AwGT3FtY4fpscJphtnJuwo1P1ZH/7KCM1stZPoY/2BFSAeIT4Pn+g/TcYdJd4PlNb5cd
         ZOSDPLHE8Da//Rd0n4KUN9l9SQr/g/KlakSeMrOX3WD/IxlKCdkJYPHVah+Ux0UWgO2d
         b00H9AdcLHF21HIq6GyVjJKX+Fb6Je8qYT78wjfEBU/jDW1qBeQwlnVzF4E4od6OLlgB
         KG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhGT/HQ1K3bK8TPssIGqP1JnnpOAhb4uN9EYdGCGT1Y=;
        fh=CUnW4yIXh6wwVea+yoj1ZMnLv75KotLBFGkreZTQgjg=;
        b=QdwSXsQat4CLa7chWhj6wbvLu7MXXQpRGuHKfrEeu8B6RARYaTzpdMKQsp7yq44AdQ
         Oo3p1+wxMBvtSzVZ+BerCTrcgOmPXt4BGl4b/h9Sl47roQp4hU25Q+84YnmBZfOHzLpY
         ooMYlYGuXbGYPsTIOlCVwA9Kl3pvKJzFg1KrIceJCyapLpwbnI+YbgecUfII2l196yo1
         TvVEzGesofzeu56iU5vac4of3gLvSCSHvmgCHwC8Fr3B/yJSXLEb56LxW3V4uBC0SV0H
         tSl+Ab3C7+5Cw0K7jhrb+uZEhcv9639uvHMVHspLLCrSAl30gX0tro0jSq/QRiuM7/xp
         C0yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420689; x=1770025489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhGT/HQ1K3bK8TPssIGqP1JnnpOAhb4uN9EYdGCGT1Y=;
        b=A8K6W6kNcKxPuW/rjCEOXJpQh0P5K2WvYFw8u4FQ4rwVZtZmLoguRsFL0INrBLD5q1
         Ly+ASRGzghdEGZWXmZeqvatnzsg49XWVx0+LH3+D5zLhAhNNA5xE4Jtkb+LcFnlpLA4S
         XEGLmBdKaKEHfBkN5/YjRATaXBU5wMuMdnRvJI0Da6im37oAei5kwbmJqbDXzn5iKOC2
         oCclAFBlcA7sUdFA2Rsmm7D/1LFvqahCPwhLX609EoqpjbZ03WQnZAWP/EfFub/5AgxI
         Q70E+Hfa1FXFVtpwE8Xu2vR2l10e0mmz7ibhoCJCkDYh4ZbFTOQMTR3tlg50hfgrfAG0
         Setg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420689; x=1770025489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhGT/HQ1K3bK8TPssIGqP1JnnpOAhb4uN9EYdGCGT1Y=;
        b=pLx22z7NOpNJjE0UFGV55JFnWvxUXPcUltOaS0Qs4fnaKtecxCQ6zHsXpdGvJUQFpY
         XkYorXiafHVXJ5Rb0MKONapHNwlF2FnTyx59/VQARFDPAHQmHRdy9lj9YWneMVNmHDN3
         VK6QpEE5J2vjgX2rhcFrbVHLU1z2iQ8c87QFPxBJX7Yyu0rcoBN2ZsqaAtO2pXk6wg3n
         KlU+HTF8u/N5NgRQsLABQbDKEsbgqI3uljyZYj8nCeWN0zgzR8L+EnROPnDfddIFkUcy
         EL16dnMVwlVbl7uQQl5LAx1WYIUiztBUEE/69SxgMvUSNoGZAbbMugupIfGGehx0ABQx
         W1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU1P7C246rzoEXWFC1kP9YjJvxyd7vZ6vd5uibN9C4HKfzk09ieYaGSv3w87wJ17j0Tj37b5vVtumNAEvgT20kMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhxxZv7H+Xk8fOqqJu0D3H8/uZ2Fv+Jrsoioum6KPxPJAfGHGJ
	60GtD6mbGejYpH/RP1JuD7iVMMGB4tzWgpk7gxm2ZRATwcKzAXKbAtxHIg4Sppvn54qdzenXap5
	ziWXF/SXWuo+OLSIec2B8rwMiCdVBcmfpL1kg
X-Gm-Gg: AZuq6aKH4YIo6eYejOW1kaA2++C7LmtHPb2E7Uq5BssYKaECjul7DUhZVt7yhUfIpfk
	5Lk4b6uFicZg3eUjFq/QAGLiFpVqm+gEf429m9rgXaAtR87f57N6iqmqIF7MMSOXusdqQAxTmKS
	g0MBzpMClPhHK3R4UF0lBRkw3Bkh6i5JM6xAh/JPtcWoWhEhhwszcsZxhJ/hH2gGWbeObPVsDGd
	wCtDcm/W6lZMaZ9lPipMZVrLuqMr43fk58shBijpfLwz3hYOIHYTQYs59WVVuo+qs1Yb9VpVtrT
	aP5YuhZvJqLUjRu43WKthfoXz7jsFnAA1FktMC6SZAdHkab+6owuPgNuOhxaTYKuFlA4zjfwBJN
	L4zJQZWdtJOxTpA==
X-Received: by 2002:a05:6000:2287:b0:435:b6ab:6c1a with SMTP id
 ffacd0b85a97d-435ca39bcd6mr6717146f8f.49.1769420688458; Mon, 26 Jan 2026
 01:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346F03BEBD966394DEF1D2A8695A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F03BEBD966394DEF1D2A8695A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Jan 2026 09:44:22 +0000
X-Gm-Features: AZwV_Qie9o3mYmb8iKUvXWL98uu7GFsBm7ul8GkvHx8ee10_J7q9KAecJqgE3ns
Message-ID: <CA+V-a8uA+qeeCCFmpHG=9tsb4LnHPjKP6j5sAF6ZitQQAdYuJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H,
 N2H} and RZ/V2H
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27403-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,renesas.com,bp.renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3DA2C8626E
X-Rspamd-Action: no action

Hi Biju,

On Sat, Jan 24, 2026 at 12:47=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 23 January 2026 23:00
> > Subject: [PATCH 0/4] arm64: dts: renesas: Fix SD0 failures on RZ/{T2H, =
N2H} and RZ/V2H
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > During testing of SD card functionality on RZ/{T2H, N2H} and RZ/V2H evk=
 boards, it was observed that
> > the SD card initialization was failing for UHS-I cards. While investiga=
ting the issue on RZ/G3L smarc
> > board it was found that 12ms ramp delay is required for SD0 power regul=
ator to ensure proper
>
>
> It is 1.2 msec voltage ramp for switching from 3.3v to 1.8v on RZ/G3L SMA=
RC
>
Right, thanks for correcting.

Cheers,
Prabhakar

