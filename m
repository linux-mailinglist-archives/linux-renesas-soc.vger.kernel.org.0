Return-Path: <linux-renesas-soc+bounces-34197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GanRCU/VM2oVHAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 13:23:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BC69FBB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 13:23:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=esiGBbDd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14869302F048
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3CC3F1658;
	Thu, 18 Jun 2026 11:23:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540963C4575
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 11:23:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781834; cv=pass; b=AuhgZCMIjC2mjr5SKkDXgZSzPvCmwICuIzLqpF1w/Q5ItUn05wtHt9c970AoVI618QMWkTng8P4PQoAOyweYUxVULOH172s5nYwIb5jtdFZ/7PWjOre1FdnoQQUnHf5NDdN1YzNZWbMQs/kINlSomEtj9NXE+Zi30QWacemBUMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781834; c=relaxed/simple;
	bh=ftOGb6HrIA4XLF+PgZmXudPusKXh3HbuMIuy1WSwPxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjNYxTSRj+PIKdEXVnBeKBGyrja0zVEqfR08M3IC1L+GrEV0hIEID5ocB3k1vGrLMPZo/YF8YwH1LTeTfcpWM4NZO4SbF/tGtN5se3W/rFUbPpeBp4u4GjLFIoe5G65A/IblzSngYSMzFM+emoViQ0VNkgicmPt0w9fNSJ4We78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esiGBbDd; arc=pass smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49230a567a9so3948505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 04:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781781831; cv=none;
        d=google.com; s=arc-20240605;
        b=C2TUUWfeWYS/HiiG1Qp6RU4vIuhZDHO8espOK6PV2DwbiXctYh9UgLOlmde3PWdwTL
         HJf0V4GOiJ/isn08Bs1NLit4VSGKZfbFjbIBKdEam9CQGfPBWeTN9+k/V43rCEPVPDRB
         p5yTdSA1jEzqmmzESeQuho9iQzHWZA7n8v7hAjJjNjRRhR0QFECfKYZLFC9JvTYB3i+l
         S0ZLeRluNFjnDBMQELaFb7+CHfOSv7uzLCddu8Op4LuNvZwlpKofdjDsevDfdq7Nr/Ge
         GTAzUlaMOkRxEZrHzPWowRIxTQFyme1pXYOSxYIkxmmwe+Z/YtqbbITwQPInqorD6p3a
         HkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7pE6Ixio0KUcBqTkyHkIjyjk/z6EK5II6djKg6cLrY=;
        fh=4433pj4f7/OK7WhWcfd8ZPzG+uV3a9faEsc+xgjZG44=;
        b=haoW/+aeFSEMHpDnZcAXA/phcqjEPMMNs/eSrNcRf8kSCk9HZMF8BBUaTM2x0Go4NM
         31eLRYwkR7nogOLiHSAlHFnu1TvDUVjUhYx/Pea0n0+fFIDqfU7KhjE/VeAbULclibhR
         9bx20XCPp3A/bNm1asmXI1EbS11yQqo6PzygnDbYu8RHea45NxYH6lIF2blmzCQwQGuV
         UqEHWXnp7WU2gyQC/B/55bUGeuKiPOSc6HxVD2/OG2mWUHBduxFIvxXbVKROwqwQfTKI
         qzlqq5/fgf4WPjWX2UTZ8jZUMtrfoQu7r7tMGz5LLiKy7UwA2PV818BaaJIa65ZEPvNF
         KhNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781831; x=1782386631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7pE6Ixio0KUcBqTkyHkIjyjk/z6EK5II6djKg6cLrY=;
        b=esiGBbDdiJAOH7zUs3QSC/EklyV3tnmrmWZxHM5jw6+G3Kb5/gMWna6ZtQJHHwi9Ln
         foE/gYtJ19SXNC6G+skr36HCGb5iWJgB/ZsZZlwbZa+lhXqLHEbiRpfubQ53TwrSGRd+
         LQSJEKLtWfnL9bZhwT+d70ZNmwrgLcFoxw8iT51pZhoRDseE8TJM1OygSqwFO1h090Om
         tslpULxZfKYxcqLJ7imRoPxDDnX0J6xRCoOaOAAtnSFdHa6G0os+6UIlWIihqcF6IJHt
         q1aKL81Iwu7jjcGydsf9OBQmWf/Z3OiYU+38Dab4oyq4rksQp/4b2fSwLUuzK6Xv1U7J
         VuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781831; x=1782386631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7pE6Ixio0KUcBqTkyHkIjyjk/z6EK5II6djKg6cLrY=;
        b=l5CY6rltDhMqPav4nXmabnoq/Fm81qnCqhvV3CwJuiCS9ROII+0+F/tGqrNuvK1AiQ
         NLm7XAjaOT9u8zDcE0i2lcUIy7B4v0rfJ07Br5Qf5ohBJ6TAc3GNQxIXgpmwKeXcW5B+
         XknwHJHGV2ksJ1IiV7HU3I38cOp70XYxQ/GpE7VRqmaryf9iuUuqaPbuM2RrB0jDBkVu
         DT3AO9jmV4zXrztio6+uSmSzjQqyRL4H2a6vf6AR3ZvNLtjxr6XhWWROMcxwtknqCxNm
         GGvFsrn4Q7ZAcBw6Kz7C2/BU1sKms/1O3LtmXaBx1rHrtI+dE6c/tCTQz7iaKJySveJ5
         erBg==
X-Forwarded-Encrypted: i=1; AFNElJ9PBYZpnZ+FIT5ltB+GuuezneD7oAz3Yypz9B9X2MTXGCyYEM5TxYnD5Iyl6yvM+CQrY8opz6pm8NvTDtJ/m4saeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZu7O3etzBnsRXQ2uTIAY9CMtXYyn/45Bg/ImAk462DOSUIBDr
	xQ1mBoi6+R6ma76kO/MP0ktwoqrI6rPaUJ0m+Sy1sYKFtyBD4TH0bqQNYxdkTK6N92MPNMq3XL5
	2clEF9E4jFAMHbJxrNbE+aCOZ7d9vjt8=
X-Gm-Gg: AfdE7cmSZqQkDnSLUXJuZr7glQCrTKZSLJ8fyN++vRx2+KkT3BrXgMMec25aNpLuo07
	j/zq2rY6lA7wAXBLZzV94w3Kj0ZK9FrLOSmZPfl4CxJ3aX0xohcCwsDsZ+k1Ud2TVolztknWenT
	wvou72ufdlui/hjmkhwrmEO4Pk8G7TwZORBWo4N2s1kPnw7UH7AnlSzE9LOEkxCK8Vfvd+mTYKj
	PlEBzYQ8isUkDPsNUhxiph9tL9gBn7kRnw/p8CgYwzVrWy9I3VIDdhs+1friC9TDpkp04zgnRN2
	s9lLKlIie64guwD+uQU9S9OkrJq4OvtrnZideRSDrVCUOnXs79gQs23Gb2Php0M4B2af0w1YxkC
	vwHGYisrFTfSwmX0=
X-Received: by 2002:a05:600c:8b58:b0:490:3d62:f5e1 with SMTP id
 5b1f17b1804b1-4923341fd3cmr119267995e9.22.1781781830725; Thu, 18 Jun 2026
 04:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJ95P-jxChrTY9w@shikoro>
In-Reply-To: <ajJ95P-jxChrTY9w@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 12:23:24 +0100
X-Gm-Features: AVVi8Ce8X_0PfKSaPq_0DdhjnZ-uD3CRtAOp5rNvdMgkWFj4LOFbrRZD_iGqSMw
Message-ID: <CA+V-a8sJoX2CT9fq3nxBdWOEw2vOz6tOFtP5JZAHhxkpG0WVmw@mail.gmail.com>
Subject: Re: [PATCH 08/12] rtc: rzn1: Dynamically calculate synchronization
 delay based on clock rate
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
	TAGGED_FROM(0.00)[bounces-34197-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB0BC69FBB0

Hi Wolfram,

Thank you for the review.

On Wed, Jun 17, 2026 at 11:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> As mentioned in another thread:
>
> >  drivers/rtc/rtc-rzn1.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > index 06339adae71f..bc6af59744e4 100644
> > --- a/drivers/rtc/rtc-rzn1.c
> > +++ b/drivers/rtc/rtc-rzn1.c
> > @@ -71,6 +71,7 @@ struct rzn1_rtc {
> >        */
> >       spinlock_t ctl1_access_lock;
> >       struct rtc_time tm_alarm;
> > +     unsigned long sync_time;
> >       int alarm_irq;
> >       int sec_irq;
> >       bool alarm_enabled;
>
> rate =3D 32768 here...
>
Agreed (in the rzn1_rtc_probe, to be precise).

> > +             rtc->sync_time =3D DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);
> > +
> >       }
>
> ... and move this to the main body of the function.
>
>
> Then, we should have all values always initialized.
>
Agreed, I will fix it in v2.

Cheers,
Prabhakar

