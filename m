Return-Path: <linux-renesas-soc+bounces-9687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869E99A58A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 15:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89405B243F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD050219C83;
	Fri, 11 Oct 2024 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqmnQ9kA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1721733D;
	Fri, 11 Oct 2024 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655053; cv=none; b=B7CVpkq+BKIv2nt6ixTpvOT4etvJE+VThkNZYgZKSwZPBzu6TbjV8mH++tWCPr87IcjcHS9gvMuM3LXxMamIdaN4yC9AI/tL2ncFvbURL7pqZ+v4Ks2HvwOxby5kkPY2xfNBbW/syFwe2nQUu/Tk6gRH6EBrAEWx+KvzedzQ/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655053; c=relaxed/simple;
	bh=T0zQjBp46UcxDnphzem5DLUIPuArGm7W5N4Z5e4L37E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tn2WdBmhSx6bidmpbVno9PUdcOn3xCgkAe5aBU619EFHOf899y04pAW7uAPc0x9Uardb6J+7rl7p3WWaIwOhEPK6MKMtE1uJB33amPKYuidnlAEW4pXiPIlw20ZyQ3GmGVmGn4l6jBib38RyL4mGi48dx1bmagA8V3ms2YkEQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqmnQ9kA; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-50abb0c511cso603600e0c.0;
        Fri, 11 Oct 2024 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728655051; x=1729259851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0zQjBp46UcxDnphzem5DLUIPuArGm7W5N4Z5e4L37E=;
        b=lqmnQ9kAaAUzM9lbBgoxynoCiSMqy/sVy5yDhZQupWEPntznaAkugF1TwAnCNfWBsf
         v7sd/zWtBsVk0jwkdoJVIlkBBrPY8BeUHm21yyzCyFUJk/d+3p7T0w3vm49wINX1ihOB
         uERXLZuoRniAO47JlSxFNATyTHYwqCes8aZP3FbQDgfzdV+kV39eM52qsL1zxJtLIeZO
         QGnpo6MMSWq/YpGgWRVXdCbNSIwcyHDC1xPGLOoNiS4Dr+ycIA8EMtCXxg7ee2Yk/F1j
         5tYI/jl96bYfqRXuU1rhh+rSTdG1o1Q5Ohkhy9VhyR9OoIC09Ezf1NRI9XamackXZUSc
         ubDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655051; x=1729259851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0zQjBp46UcxDnphzem5DLUIPuArGm7W5N4Z5e4L37E=;
        b=VfGww+zHpCnGV19DRJPjSTpYJ6Eb9fV+9U3smOr82Env/AKyOXwIWKlltwlZyj/TsN
         qCrOakrHYhELDCchSgo/ykswld1xYEUFeX/Z9S1UFTNhUmjjp2tNjHorDFa0JaAH181f
         jt9tZX1fvhRFj1AO5/ZyXNcA3S1tNg4teEf4s7PDy6K++Xv4Hb1DVRq8xv99egO98Sk6
         hgPJLfHMabsYIg1xbXyXUBEXKX/lf0hAyqpX+W/atJNXupC/yGzCu9Hv930wRkk2is4I
         6p5Wl/k3auqR/jmRoX83mShl/RlLYzsRT/8dyDMmG6xbYyRVrHIOLjR569qWhQ2kAeGY
         h9fw==
X-Forwarded-Encrypted: i=1; AJvYcCV279I89W1tYmuLQNCel2D4rmzy8cnlt1dxGxjr9PBpIduqLmVn9POFrRKMb/+BA6ID6Spi0FHiLbcvjr93xdfssuM=@vger.kernel.org, AJvYcCW4Z3M+ZU5BK9KkSENPnCdL85BRLedbklxDbr/bW6Eb6DmoNaN9qQKiInVAyZSHw5m02WSssewJawUMqvo=@vger.kernel.org, AJvYcCWNrnb1oVFlRrtJLKbdT5S/nAVR/3eNaPPQvjN0Qai0eOPLmDB7jFmn44tlNu1/9NoFrG5I0yRsqmkAETo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0w7tpJZ3P4YkpvPiEK6cE+g44xIOnXGm+O8DrlLPIt3Rkow7
	DUn4sz1Qc27nyaKP9d4HkRvxjwh6z6CbPKHqPPS7sed3lhBu2Vfg7vY9WH5kXEyfQsJf+gKdAMn
	T9Tkk2FRtoYdoojuNz35jArEXy80=
X-Google-Smtp-Source: AGHT+IG5Wj4p2skqh9DuuVskUSc2KO+ylzANDq/NzLbK3ud/R8vSUM8A5FKcg14FKv4ua+/t8XlRbnV/wR27rG9omqg=
X-Received: by 2002:a05:6122:3b02:b0:50b:c245:a040 with SMTP id
 71dfb90a1353d-50d1f4d8ff7mr1387126e0c.7.1728655051129; Fri, 11 Oct 2024
 06:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011131040.1059130-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZwksHY1OWGPhYm0Y@finisterre.sirena.org.uk>
In-Reply-To: <ZwksHY1OWGPhYm0Y@finisterre.sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Oct 2024 14:57:04 +0100
Message-ID: <CA+V-a8uj7ND7JLS_GLVrwMGxfsMKPr0KHpKuLbpPg8_x1iXouQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, Oct 11, 2024 at 2:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Oct 11, 2024 at 02:10:40PM +0100, Prabhakar wrote:
>
> > v1->v2
> > - Added a helper function rsnd_pick_endpoint_node_for_ports()
> > - Updated commit message
> > - Dropped ACK from Morimoto-san
>
> v1 was already applied, can you please send an incremental patch
> instead?

Sure, I will do that.

Cheers,
Prabhakar

