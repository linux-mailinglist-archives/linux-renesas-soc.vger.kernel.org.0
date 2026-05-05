Return-Path: <linux-renesas-soc+bounces-32061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO1zKOPH+WlhEAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:35:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0574CB793
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8ED9A30E385F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 10:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5962E42882F;
	Tue,  5 May 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDDLI+QD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC34279FC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976090; cv=pass; b=lgZfa3IddIKl0XNvvQcQ/MTpCy8sqKWAZHEsCCFZI6Kh8RhEzjBB9bE1H/dAizawjFi00UcxtCFuo2RbD+dTAlMmJPnn0zn3W5zvcd6Kyat455ZhdE+sdD1Mr5J9ejYmjj7ocxhXXhhcaF0FRfG20Gco+pW8XnWp63pmN+hV8KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976090; c=relaxed/simple;
	bh=Oi6yT+ns9jMtyqJ27Q+gEhh8JyJgi0gFq61CQyPkBek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhXiLIKVb3O0P5/0f6z5zISx4/2y0h59cJ3ZWv/QIBFoUlbqF8bQBdNjlSrkeG3nrh0eHnZp0PgwKT58LRPG5JHYBa3icMsqXmIHDIYgFOJcc13X2M3+Q1oz8SIsXfuSqm9T6rfHDtgorliS4qx+6cF7nvQ4op8WMHM2MabeCWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDDLI+QD; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36520a83186so1856155a91.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 03:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777976088; cv=none;
        d=google.com; s=arc-20240605;
        b=TfJTWg+DDf+NOp2Eo9d5FeRE7m7g9YEQDKWMvrnss7qY0z6FcZ5CZC5Q0XDUClfxEF
         f+8sZkO3q+dlibRKSSDKCQodFPqRBzSRq3UIYRP9ebWNOIY8tyvqqwNgCi+BLsabywyz
         tphXPSEO9EYE7R2trf2gKHMXDTCCnQ5JdueK/jdCGm70mEPlsg3mlU1qs/uiO2yv0E/l
         zv7J9kWLYXOxpUmxi6BW7T/fJClWecd+cnp7L2F0ZDAYHCUjZYCqzY9P5RH1ke3R22YM
         rAYCpLDNqne0eKMirt6CEPMlElANvSOfibSF31SSsnyOWUnTywMeIGO34owIEXfaRoZT
         IlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        fh=Ji/2c4rKO45QwTf/OmTM3AcO4NI06O4VjVEytbrW2tU=;
        b=KQzO0cxis/ETwCgaEQwrfYnN7p79fqaPvgid7HI/Kc/fWCTcq51TfZyQDaKGhjmDv5
         MGE2Sgud4fGJcIe8ABElz6438oJmTh6PTPblqLHZnNbcGlTDjAP1PPLsMkzN/sShjSyW
         Yw4NXf9MuMddfAXc9sdcZ9nxllO/4lk9VlARtzy0fDC/qVihOU2m4q8g7dgy0lVwplnp
         oeKqlHVRDMt/okE5UDQboAhPjakxi3H8A/TNHVQqIDioUmMBso5XThDC/mQVDW5uJhHM
         fnpYk2jr9CdwxVlvUgbw9CIIb3M0wi9+yytTKLIlc02NfpX47pscAGAUvFekdkkiQCKh
         IIaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777976088; x=1778580888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=mDDLI+QDmeMtLto1Q4m4gOzEOgDVkLIg/58vdeppfDgdD20fKmKJSc5oOBYvKrC4PG
         c0KGxPE6LUeM18TJTIuCi+uSEVkxFjNz2HDyZMSW2iJ+q63cJjMsipStwxsHJS7vBIek
         OKeDmqDsh8By85nocdzXAqdltw4grbOwRY8r1kJ6dN2+noE+24tHtB/zaFTdfJkhy8v1
         4spTvTN6AnxDkmVqEz2epuao8yz9V3tyO2iNbBi/dmS9XBYzApERcaaVk3JECUYd9pDs
         Pbp0biZzyRX7CORBEYwW49P7Sf+V8IymuRuFfq54CkOwfc8lVgkzTX+HLe1/fhf7RYLE
         Pn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=Ryh0O3pT/CXRx+WdEUtATbur4ffFVybiblOXmMUtjeSkg4ju3dvArUvRN3+9V0RhFq
         EaMqYMrLLxZirXMQKN5CsScPrhW00HB0b9EpziJ4feZ4IpD3UmG0XfEfC5rIH2SuV9UR
         EhT25nQe3DUkPrpAfNK5zjKdHkMCICQnaD44qQYvRpXskvcc55pvb+oe4y9l+Bxm4LuI
         RtEN4coxIk8/DaJAXIaL42gfyQqmZ3IgRdbfmHoOlCyA01oWOCwYC+uODOJZfm9eTpCf
         Pyg/aeFm2RGcI4zMJAQGUeOlBgo4n4EPVYSK5akcwYb+tmTJ9vbPUpV3/pVL6H3OHK1E
         e2OQ==
X-Forwarded-Encrypted: i=1; AFNElJ9a2yQ/2694kcMKq9+1xXwDWSX24K9al0pzrYLY9ADxxt0Ua7uqx3BlM5tmV9InN1bmQujLIfND0M9EP5p+pMC3MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzck11+pwBGDMH/xeaHD7uA/miUz6TMV8caaeG9cNILjSN49uno
	6WrAO4T1qlfs6jKK0qHx4yuc57LTJwRxQEqKyrTA2qkWMYfo8Msc37V5OnbVUJ2mnKCZeSPhIpU
	hq63rQ5tCQscJaedCNRcyGcn2S1L2t9k=
X-Gm-Gg: AeBDiesZnc9FabinBmIpi6x6qe09NHn8r8D7igRrUt81K+Rlu+0J2+eXrgSFAc2LqDe
	XUYtUL5oZXCNtb/NDX47T9bXVkDd/zP7p7murBekMTIEWNanl8memQ393Z0r7hNcu5sPGWeQ0ws
	4Pe3G14QQq+gwVuVMxz6RjfHZ9OUDDaUIiL8ziZRTsO9/Cc9WgRoI+7zlZN7xbSl4WheyMX11/A
	L4gGyMtYOCyrdVpoXbHZitR+E8CiQYFho5aD0nrOWVLkmXtVsDVvLZ/Rn0FMXNDBqTmNGRNOb2z
	GDm9/gPh6Gu3kpvXvRq3yRyvZO4daqp7/IQMGIJEDoSEHJVN
X-Received: by 2002:a17:902:d50e:b0:2b4:5f69:715d with SMTP id
 d9443c01a7336-2ba53764d5cmr24069045ad.25.1777976088099; Tue, 05 May 2026
 03:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
In-Reply-To: <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 5 May 2026 17:14:37 +0700
X-Gm-Features: AVHnY4KKaeMIUMNB9DnqOsvfPK4v3pBOe_aV3xzWOSjuBgzN0epZsRTKH_TgDIc
Message-ID: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AC0574CB793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32061-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Morimoto-san,

I=E2=80=99ve looked into this further and would like to share my findings a=
nd
get your feedback on the next direction for addressing the issue.

The sequence is as follows:

(1) IRQ fires =E2=86=92 handler starts
(2) handler is running

(3) playback ends =E2=86=92 ALSA issues STOP
(4) fsi_dai_trigger(STOP)
    =E2=86=92 active_streams =3D 0
    =E2=86=92 fsi_hw_shutdown()
    =E2=86=92 clock OFF

(5) IRQ handler continues
    =E2=86=92 fsi_count_fifo_err()
    =E2=86=92 register access =E2=86=92 system hang

Since the trigger() runs in atomic context, we cannot use APIs like
disable_irq() / disable_irq_sync()
to synchronize with the IRQ handler.
As a possible approach, I=E2=80=99m considering guarding against register
access in the IRQ path when no streams are active,
for example by adding:

if (master->active_streams =3D=3D 0)
    return;

at the beginning of:
+ fsi_count_fifo_err()
+ fsi_irq_clear_status()

To support this, we would need to track the active streams by:
+ adding a running flag per stream
+ adding an active_streams counter in struct fsi_master

and update them in trigger():

if (!io->running) {
    io->running =3D true;
    master->active_streams++;
}

if (io->running) {
    io->running =3D false;
    master->active_streams--;
}

With this approach, even if a pending IRQ is handled after shutdown,
the handler would avoid accessing registers, preventing the system
hang.
I=E2=80=99d appreciate your feedback on whether this approach looks reasona=
ble
or if there is a better way to handle this.

The issue is reproducible when playback reaches EOF, while not
observed in some other stop scenarios such as manual interruption.

Best regards,
Phuc

