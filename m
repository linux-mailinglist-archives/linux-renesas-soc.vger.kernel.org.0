Return-Path: <linux-renesas-soc+bounces-31282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGCHDstY32n1RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:22:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B821402823
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1382303FAB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 09:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9664225397;
	Wed, 15 Apr 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtzMfdf2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E459329E4B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244870; cv=pass; b=M3pUUYctauGIeF6emcDLaQwJZJG+bqK45/jmSt8jQT83dt5f+gJoz7J8IMlxkbA10Q4eMm1/aBaj3GgIBCzgyuqDyWQyUGvotWbWwZ1tu9pqUYcLVT89w5agydzf+LeQUQee11Ufi+N/gKdn6JpK1pitfu9lKpTb+XsgWmVXqxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244870; c=relaxed/simple;
	bh=qXu//z6Xo5LnFnJscSgw4DtwEHHHbw3ufbT2XnJFOVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTX+Rj9JDtpCn28sjvEGbA+0xP4XhzyL7/LHKKC6/yG3mHKLDz1a8qEj4QkeCbDxyls88o/y7vhWsZ9euYdybEcP1e5UmSVM1PFMfVj5qcPzVU8WQNPIs9KHiqSOlO/GuRogi4oog5mhwUXg8QGFIFCZOEf4kTcu/VCe2L6ZGJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtzMfdf2; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2adff872068so33290575ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 02:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244869; cv=none;
        d=google.com; s=arc-20240605;
        b=f6k3R2c/GK/UVeoVYOl6a2LbOWPKgOvT+7sG9mG2KZRQkuVrPCUB8u5pLa8xMQo3qD
         pph9bvYatEl9L7GpTTC/L42+wfydkKd/VrtgFSDb2XZXuYNSMGBWvURY49Ji2DbCf73O
         nUNkf78nc31IBkaeLDv971cmliM9GqcYixwg6dqTV9xBYja2ElLEEx4sRiJw30iZCh9Z
         3/GsKn3/1f778+3ahTkvrrO5947gElRs3lTtD1RrFoXzyPdUgT8eTBfzTpSoaXPEzhMf
         c81vf+SuujpafSlWyXN3JH3u++l++YRk1kLPIDOnz0Z2YP1nzueLM1kvmZOhSjMjEROT
         vDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        fh=+u68warkFnjeRfnUVoEwNypKgPqQw7BUErbC3XMpFXk=;
        b=Etg4O1Vi1ByowwDUTS5Qg7InGi7fiaFqdVin58jDd0kB7Ka7UdD7b9McE51ZcQFaVz
         KHxIj8clDH6G6+J+y3TPkzbWW1CY0P+f4KM4mXqLkH8SZM0zlmmTsfBnln0UJy2SlayG
         blRXJHr7wQbU6eIqi/+I0iSW6LBF5ZdbBb6sWv9CSnsP6fbSN1O68jzA3PLcUA/vou0x
         dyax2boNM1FA/R4BI1v1fvu3IXxPszkEZ4RO9m5O8PMd4H7AHopZtW21jqmj6EdsESAD
         tWEK3knyohNq1njnbOXlbb6bm2VkF+RPB1juDiJ9PwjBDriYvft0m0Rkvj5XdeKio20L
         o5Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244869; x=1776849669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=MtzMfdf2VAvfDeqNyD5OLJUjMw35uvScAhno0ouNZ7l4zup6rBXOneFGvrckCDgE9M
         Qy0Q5dxCF+Ver4cOPei83bBple1qS6yDiX/Ya9s0N0Uf4xscpTwOkazFgfmqQdlYq8n8
         TVNZZ+2YGSABFm/E2hAjGn9SGBHA5agwWuBaQsg+0p7nMHi7nVoGLK+ixiC3T7s481R7
         htKGMEBqxDdbdHx//YxnmXIuPgNw89eq3fuKcLLDCNjGlZLyRfggIuHRpD0OYWXVgurp
         cgsOOK+cogrVJhMesZA/m2I5KKrUeYCry1aFm9+RCobcHNUaAduu/IBHGNXtj61nFxo4
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244869; x=1776849669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=OYUnhY4w4pJ3zV3aA5Qrode4Shb1RjuPD4c9wCXY+O3rhsJREGygNFOOG5QB+CSqyL
         ocs54VaaEEAfmNS1Uw9U80iLEpl9QfV/MDgoFPyz+PpxW9ewPdYpgi8dyIcr6QLdDPk9
         ivPlBUGc7XfoAk1DEgxjA+IOgTwef9GHksipJhrv9rgcJUtNMVVxexISkxJMEGS9xV2a
         tkBVxu80oOd3edNVYkp/4lVHrupDuwg/LHwzTbPLjvYdKfAyXpw3T/Ip8ityvD2HgeOa
         q4XASUns4QVEPVvKlD9ktlFvONHw87ye7LZE1wtybWKQBqYDjS1vprAA7ohwTQGpokgj
         bT/A==
X-Forwarded-Encrypted: i=1; AFNElJ8jEFs20kkasVpRxd2RmYN7g05PKHE8OvpJBDCPRmdYTbUSe9FLKowFZddlnt9P3y3p9w5QeGSfaQFJnFamukLwjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXyZjKGixbAWAJdrPWoVT4OzpW/UyGGj/DKDbyyA9azvvGc4NS
	PnSanAdyJb64PCwTyn3bs6vCPw4fkifsABXxGTgR1253uMu2KHhNiOyyk2KZ5MchdoNAJlh6DPZ
	aorUEpZ7cWJUHceIVipZ7XmuhHSQ7n3g=
X-Gm-Gg: AeBDietHTMb43dra1CMh8OPqmiYRlJ/hDW0QXGNANImK49NPHIZ/85IZvIH8k9Sdk/z
	WevZM/4gWBoBfyXqvYEyU3ArvpTWaxr5Z54bwv7JNbf2yyFznJYjWlXr/WjaUo0tUk7+6XTSihu
	axUtKopMJhKkuVE9Hhln38ErBCg1XDM9SWl6Pt8FrnrDFpFGGyINoOUUnk3MFiF7BSEVl6ZLFFu
	Wpl2G2x3FRcWqM8LtkoEadyDxqlcWjCgzdo1tHI0VVQrNJ60nM1ZkHUcv28obo5z3JGmUH2CFdc
	vR2ADgchQfFG630gcnRTnqXGzo3If38BjgfBf3chjEyJC87B
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id
 d9443c01a7336-2b2d5a7773emr209666405ad.36.1776244868799; Wed, 15 Apr 2026
 02:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:20:56 +0700
X-Gm-Features: AQROBzAXSd3qJJschZNpIapnadex0hZxdzsnez-28xKExmnIGX3RLVbWSqVsXBg
Message-ID: <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-31282-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3B821402823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

> This patch should appearing much earlier.
Thanks for your guidance.
I will reorder the patch series to place this fix earlier in the sequence.

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:28=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
> > This ensures that all register accesses are completed before the clock =
is
> > disabled, preventing the system hang observed on r8a7740.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
>
> This patch should appearing much earlier.
>
> >  sound/soc/renesas/fsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 109e06b5f32d..9df3e91ac79c 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> > @@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
> >                       ret =3D fsi_stream_transfer(io);
> >               break;
> >       case SNDRV_PCM_TRIGGER_STOP:
> > +             fsi_stream_stop(fsi, io);
> >               if (!ret)
> >                       ret =3D fsi_hw_shutdown(fsi, dai->dev);
> > -             fsi_stream_stop(fsi, io);
> >               fsi_stream_quit(fsi, io);
> >               break;
> >       }
> > --
> > 2.43.0
> >

