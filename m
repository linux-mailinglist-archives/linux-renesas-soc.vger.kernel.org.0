Return-Path: <linux-renesas-soc+bounces-34193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ScLfIa7KM2poGQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:38:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1169F664
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tEu4gm7q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB40D305E17E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA39E3EE1EF;
	Thu, 18 Jun 2026 10:37:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC43ED3C7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:37:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779072; cv=pass; b=hVM49E3ViFLDQLixTNGLQRyDJEaLeUDqCGq48mZKnnQMMtBdrPjgKA/i9HISyBmUuD4d2BLtt2QdPEvOkeZUnAWRMxqxJXMNPq1qZqL5xLxpYnLqd2G3PpthD3tcHFycOHN4/TmQYnIDK8CVadUALTpdH+963LIIi0IP3IyZzHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779072; c=relaxed/simple;
	bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eucCE7o1/DUKbBHBno9fhweOuVr6I4DoK1s1BrB+Swp3KGM8lE0d+55JI+debNwgc+XSXdnhyQ/x8G5UcmZ3wuaciF6n/EQwCFXMPwg6VuiF3qh6Quaz0KIpEq4FJiC04EQfnmO1wNSfhsq/mBn4i6drLOa7ttnCq2q75jIWrS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEu4gm7q; arc=pass smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-463f1165e16so603640f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 03:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779067; cv=none;
        d=google.com; s=arc-20240605;
        b=EKvHtEP9rLW9Ma9V4B99a539HkSZFc9kpIvZNhAlkoOkYlIFetkZlNcRbk5AdWcAeK
         y17KXtqP1PimYiv9u5xNxHGJOXU0c1Q3BS2hEkepN5GZtP8Xyu4Nvg421cE/JErhhR6d
         gAf+U07ZfZJsDbIJ4mVGZOItQgu19wPQ9HxNkqqE/JzU6BdzpUu9Hl3EZmJMH3cGqSUy
         FqkrWAey5f+eYU7yq9hmoc5BhWcuhkjOq1Fqxnat6BF4EUv+3xfmnRj+4ladNmfRjF+M
         pf6wbKqIcbJrmB87pKoqqhRrWmxNoIvFXBc0vcvrvY1yMzWPSok1GdE53ht/6y/bl0cV
         ECKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        fh=h5lyNycauPX6hrcsU3J+gIhukP9Nmih+oeb9vRhsoPA=;
        b=a6XZgnlLfHdkQktu4FRbHiDIsCOd44zJVk/DJZiQlu0lQ+1s6Cx/CC1QOzNCYz5NM0
         7AwfaSGv1qn1N7MuOr7QILQCqe6rpj+f/K/uT6YQ4pc9SDWxkWGP5/x7C4VMHJG9f8qe
         ISsdkZX9wCqi90v+iROwBTH2/QlDBJ5QbkS380TrxtC0jcC8B1A58oKoHCNmKkotm+D/
         GMnhlVPEK/PankqHB+VKVl8MW2H5mKbftZUEW1Zs0HSl9hw5Cc1bAUoVXK+M+zeV6CXl
         pGRbMlirXIGPit+tZ5LWdpeYc5HgV7xmoC3quuVSS74qAMjc9B/LwT6mI9pB6HNCInvJ
         06Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779067; x=1782383867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        b=tEu4gm7qVnEnUNpLwGXRBpmUObM+sYQh5LQv3qZjptgI+HsyTJ/Gl3AMmCn+50hPiw
         vZgTbMsKMfMFRgWqNlhGbn0hr5tNItEoRdJfN/JvJb0GyKUXHgq6z+8it0wkDI8nqBA6
         lJhuzIQQCzvmCBcOqIOI8c9DZs3PnA4xXUxkFKls5JV26Q+ygzgylG4hEnzyRGYWvDJY
         tnNiYS6V5GtaxIE7TtJVKck12IH2xch5zleHsXBmIkzPXHQFARmZAWUK+rDX8bsqpIHY
         wloagToibDodLWsD0vOtPsZZde9+3ou2oWjS3l1OQq8hD6HPYs+w30TIPEpsN7hynYbT
         38ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779067; x=1782383867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        b=Mc+4yFvqXO53sv8GX5i0J24An051M2/u1R5J6TSVctlNgvPgTfqU0HSArh7Euy34Gq
         gRwC1uTtgOqTUZfiKOX2FertUVjZthRZ/flhXcdDpEm/D+L7RbE7xDDVN25DYcqc7kqe
         OTnGwwU/CoPgB9O/gdr5jm3C101/qMB00/YEzKJ1LMs+4Q8Wasysnz5RiSnaSb9ZN5TH
         E8ediojl/dhgdTwiJxh7inR0exaVSJDwnq5k0HY9i+qulG89dwZK4uF1X/YGm0okVyOb
         G4lVfS93YYzxmR9CKhfAcrKMqBCpwk0yuHH4/XFrROHhImwiQ3DddrXwV62rscYoBCc+
         B1dw==
X-Forwarded-Encrypted: i=1; AFNElJ90SWRzYcFBNn/i9u0FiUUX7w27nVMz/XY9kClEV1QOOL3/Xv+tNt7QgKfmtrPCBrTki5Sq0oNG4vmmpxzQt1SorA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKiSPhLM8tyhUDVb/blSTlhqQiSIZ3EbGdgfrWlWSdvKPYArbK
	EYzeF6dPmB7aMk18S8FTl1lpZsNKUqsRM7LW7WMI/aYS8cHJYmGSenUZd2Kan1HKa1CpbE8e+UB
	HqovWdI3ViqYYpwL1A1p+GS52zKYpiXQ=
X-Gm-Gg: AfdE7ckhK9tZaVgu64XR99ju+2qM0Ml1LJ3jchgJlPi9Nh0QL54afR2W/8J1OK8Nk87
	pXARHfrM8BLeaZAWNz8VHtWPK0PYkKEq8DVWUfQIRyA6/b444fVhJugWm+E6R256OgeV/iwlkRK
	dFE54c6G+WaPXjEkofLeuNeFyeUjDeTa7+gyppp1RDHQcaUIdO1nU027eOZaTKDTHiGDfGm9Uvx
	qZpJVtcLEs/08cYZ+n+bLtgPtlPqeUL0c6VBJn2EyyinsftSeuc0p2YF/f5zJxKxSWe1q3m1RZ3
	DvYN0gRWS7Yw9ASWoYPb+aRlvM8seOtlRfM5XGAT7WQL5uu4muzqQJN1cLCSrF3uMfALI3LR+GU
	zPYQpQHHhACjP3pM=
X-Received: by 2002:adf:f691:0:b0:460:3234:293d with SMTP id
 ffacd0b85a97d-4623955c292mr9564839f8f.40.1781779066727; Thu, 18 Jun 2026
 03:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJwqDt2jUfhSD1x@shikoro> <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
 <ajPJHKut92mAoo-B@shikoro>
In-Reply-To: <ajPJHKut92mAoo-B@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:37:20 +0100
X-Gm-Features: AVVi8Cd18WA81bqmRQKOqLppbTyxhBpMr_k_9brs1kLBCen_Zb_vX_vTX4BhCAQ
Message-ID: <CA+V-a8v1DPFvu0_M_XV+efkJL9UaqnmuuRE2o7w9pyh8geCJ_A@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34193-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38E1169F664

Hi Wolfram,

On Thu, Jun 18, 2026 at 11:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > For running s2idle cases with rtcwake > 60sec this feature would be
> > helpful. What do you think?
>
> I think maintaining such a fragile feature is cumbersome. People might
> have different expectations and the maintainers have to handle the delta
> then. So, if we cannot to support to a large degree some feature, I
> think we should just skip it. Until some user really wants (and tests
> and accepts) a half-baked solution.
>
Ok, I will drop this patch from the series in v2.

Cheers,
Prabhakar

