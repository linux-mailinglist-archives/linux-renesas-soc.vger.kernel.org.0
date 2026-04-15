Return-Path: <linux-renesas-soc+bounces-31281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPmyMnFU32l1RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:03:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFA40249D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 11:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F06FA3016D07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9342F547F;
	Wed, 15 Apr 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkUhTmjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B32797AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243785; cv=pass; b=lhustmRk5dRDgcFTkc5m4vEVNEvPNhjsyff4xMvW3TTUbddjeLKCxR6fmtQFoOt4MbrbwzJGvWCiszFAjMxXpPI+wTpSMPF/B4fzXHgFdlwAnI/0dXd80ebcR6NX4ME7xYTol24XXqrpCCLC42RT13zhO7490LsnEUuSIHaklKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243785; c=relaxed/simple;
	bh=g8oimaORGIUiIaEIuPOcRHBRcNq8Tz0N0WhtWq2zChE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prpvmJaPaheb4SGwGOTj34QDuAPXxvofB6uxIPFde8hSo6l2xohWO+gbBfO4EOlek+9aYvrAOwQAUC5bT4kietTnmIGYdBM6IGofGuKrWe+gL+pjLiP4L4M/F7enOusVUzfW0kv/9Dttz/FhPYeAnE1LM8ZfnEl0AbG7pj84NtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkUhTmjM; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2d3a9e149so20623675ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 02:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243784; cv=none;
        d=google.com; s=arc-20240605;
        b=OXpDDFFbTQiTznev8KxxBCBYCKZ1AKfDhhf/RV/p4NDSOH8CtaX2lwtX36U7OD40Px
         n122Pc8hYlXH7eryiHLLCXt+R8CKx17HHkxD3Jmw/5/4Wz3B/8MUM0+K4zcUUL/cjHGl
         BFE9ieMJVHqBiDyt7RPnnXkXjQCugNrhuRKjDa1TzXWt3Ay1+gwWBfQCf6/EFWT7xlsH
         Y2e3uLUBqVyxUP2x36qITnQrGZouPIIr2GuO6UTQh4JQDQtuB6LMpM56TCAh4GgGwi+S
         jpE63epXN4rvQH1a/yU/YtjNqyHAia2G989SPt/8G7ZJwnkU9QpCnIvZ/WZxKu+jduOX
         kfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        fh=M/4c6w31SL2Vj3eiExP+/i0NJnig9yxZVmpkjJhKl/o=;
        b=O4p2SgBm9ubtIKTe99G/X1FLne0qVbLWPiDq7rD1pyauzEZRhiLyrAWs9EaaYXooBQ
         xDuk054GMrVSKzgMz6ieKwxh1Zl143O7vcFXBhPStyLmbCPhTI8RWAAF/m0PvFfAi2hM
         vojVju70hCBxgXm23VyNr9Iwgd1HEVeZSv16HGgyFDFKapm66L1aw6DlavtPdH9aWC0w
         vrgCmPGTqyiSzQ4TqT5VKD+dl1eACOL2US5rk0RyOopkwlPE/hAtryhRBcjJgii1FA2U
         KQ50lrnGc4eqN4Cc7j3wuDPRJgtQSBVx7+fxNpadsPUb8+/iyy9SKmS68/Xv5I5FVG4f
         lrpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243784; x=1776848584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=QkUhTmjM7pkE6g+5OaZLFr/xsxJki72icpopITnJXsTxr/eoNjsNLWlhkb2LxYMrL5
         rU9XzA1ktSeZzK1rtjMamf08jlXU9wLaOEQ14IC2Noo4jv6o+xrsXquYxIXJPNDbz7xd
         toh9ib+sTh18uq389ZelxTojGvIV3G620IlnNtwpr6W5bD8E4we9lA8Y4vo9ZSU2fMId
         E2rvqN64dTEbLFryoRZn5nWX6Zi38sZRnZCUjCiBQKSlu0W6RrUh7N5u8KxLz2B0WKlp
         4pBaOy/mSBYb2Q/Wmc0YZ123pCpEPPa/mu4/NtyrpyI8n1o440TYLiEuS/zasPKQnPNj
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243784; x=1776848584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhSm6AC+EBob8Si9/iWbHEozFaMuoZoR04/c65WN25w=;
        b=PZmJfodo2tgM2ONDB6BY3HVz5dqDdmy4he9t/PxatHDFdOrZ8KfmA5P8zlem7gXlVF
         2ecAICzPNbcrchihaEQBueux81ucKWYB3LXtoj1hedpSSBpFMiZXE5jPofNEOXiI6SIY
         USweeoH7G2cBk9aEPtI4aOvzhY+C/o+MOio2a63WTTsHqn4JB0TEebx/m3EKeYLeEjGI
         bzcMdAWydHfr1YqQFTk4uM71tMqNbEZWhATq2MirEY9Muwv6x+LXRFFxDCzoEKILAguI
         NDTNV6ZfTG/vHxZUqTvnCIfWpZ4TW1hZt+ce+bHzqnwpijQyZMNtxbrku2WW8KdQ1pWS
         kAEw==
X-Forwarded-Encrypted: i=1; AFNElJ/TbzR5eo4dLg2aUNkaz7dME+OCJN82O670ZUNl6elCgLwgD7+faRWTCjNrW5zCaBp3Jt16xsgCoKSnefRGqujzNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNgvonzXcEjbBUNrh+7p6nS+mmDokQEYqWKnx4qoqGxr+nAh6
	IqbtojwvvTnip2EqOUxkCQs3fqkLqQFrcBscsWJ8fs0Ir01XlFBTK9cu48nTcfHsMV++gQ9oEVw
	WHRlo2mRPlPIaa247IOMu9Bev7wFcoJU=
X-Gm-Gg: AeBDiesXR7OI4rQEJt0WxiMmSEz+FmGKJZWdWnzEkq0FemzkbpNi6i2nDss8fOeBb8N
	OuOe9qoQ9HG2Itw8eBa5/vibP5xcAxEtPCy2a0EsTpehPhKJ+ZOWzDviYSW3vWg0ANS0D+kq3v3
	XqxUW2e6NDLnS++Vv+7q2Y+xL8s9aLz/VgX9htm5MfqX86LYQ6SkcggpGRLlalFf46u4PCjLN1j
	nLVn6GTVXA0EQ6ipejs8PrNWA3wztwNw6lZMD+0AMZ4IsC0ryRLHpQ19SDk2n2seIDOmOEPgkRh
	lJxzbjtLtmCad3i2XzlSgu+RrzZF895vjH2ErNfRlXJgZNiW
X-Received: by 2002:a17:902:ffcf:b0:2ae:4d6b:b2c7 with SMTP id
 d9443c01a7336-2b2d5c7e6cbmr169035445ad.9.1776243783873; Wed, 15 Apr 2026
 02:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tstepes7.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:02:52 +0700
X-Gm-Features: AQROBzApjElQGcdJZxtKJThRB3FUMvNfZsYqiHMqwpO1zQDkjasjpTPQUplvsIQ
Message-ID: <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31281-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 84EFA40249D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

Thank you for your detailed review and feedback.

> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().

I will fix the coding style and use
guard(spinlock_irqsave)(&master->lock) in v3.
It=E2=80=99s much better than adding a new lock.

> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>       int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?

Regarding spu_count, I=E2=80=99m not entirely sure, but if we increment it
even on failure,
the counter might become unbalanced and clk_prepare_enable() may not
be retried on the next call.
Would it be better to increment spu_count only on success to keep the
state consistent?

Also, I have a question about the context here.
Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_dai_trigge=
r(),
I think this runs in an atomic context, but please correct me if I'm wrong.
If so, is it safe to call clk_prepare_enable() under guard(spinlock_irqsave=
)?
Since clk_prepare() can sleep, I=E2=80=99m wondering if this could potentia=
lly
cause a "scheduling while atomic" issue.
Would it make more sense to move clk_prepare() to init time (in new
fsi_clk_init() ),
and only use clk_enable() / clk_disable() in the trigger path?

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:27=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Hi
>
> > Enable/disable the shared SPU clock in hw startup/shutdown. Without thi=
s,
> > accessing FSI registers may hang the system.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
> >                         struct device *dev)
> >  {
> >       u32 data =3D 0;
> > +     int ret =3D 0;
> > +     /* enable spu clock */
> > +     mutex_lock(&fsi->master->clk_lock);
> > +     if (fsi->master->clk_spu && fsi->master->spu_count++ =3D=3D 0) {
> > +             ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +             if (ret < 0) {
> > +                     fsi->master->spu_count--;
> > +                     mutex_unlock(&fsi->master->clk_lock);
> > +                     return ret;
> > +             }
> > +     }
> > +     mutex_unlock(&fsi->master->clk_lock);
>
> 1st, please insert white line between "int ret =3D 0;" and "/* enable spu
> clock */".
>
> 2nd, besically, FSI already has "lock", and using it for several protecti=
ng.
> Please re-use it, and don't add random new-lock. It makes code confusable=
.
> Then, please use guard().
>
> 3rd, I don't like above count inc/dec, and mutex_unlock() style, because
> the code unnecessarily complicated. It can be...
>
>         int ret =3D 0;
>
>         if (master->clk_spu) {
>                 guard(spinlock_irqsave)(&master->lock);
>
>                 if (master->spu_count =3D=3D 0)
>                         ret =3D clk_prepare_enable(master->clk_spu);
>
>                 master->spu_count++;
>         }
>         if (ret < 0)
>                 return ret;
>
> I'm not 100% sure, but I guess you need to count up spu_count anyway
> regardless of clk_prepare_enable() result ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

