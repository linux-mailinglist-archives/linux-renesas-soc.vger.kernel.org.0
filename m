Return-Path: <linux-renesas-soc+bounces-9429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86E9905F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B626B283BCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFED420FAB3;
	Fri,  4 Oct 2024 14:25:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E67215F6D;
	Fri,  4 Oct 2024 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051935; cv=none; b=CTWYZw3p0CDYVmpA+0e2uYA1sTIyZntIkzTh8kwsVNjjOWWDM5kI3tKrWaNSfGHm3reR4knTh5gXk2wss/nHnPqDRGqskfDW3yhYAwiThYGTKP51eKxiN/JVE92yygW9VKwvOfdDVvmIuprTHDP27G4hY7Ff91J/+fpLD1qzvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051935; c=relaxed/simple;
	bh=ZRxtgD0xZNzwwUVZdQOvgA9qgSKlSBGpO08yM+LiPOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7A0Yg+BISK9DoQo/7L1xja7k3oAfREmEk/iSTDdJiSZNFVpWMLggmT5EJF6hcn+QqgxDlYPimP2x7jrse9SOCXrSZCpxP41MaHK6xCR1gAgS61rH0/Ef/QNu3n7JFH0gJ8wdQ4bfMzroMXkd93t1mOA/QGVEkLg5QTA7R9G+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2772f7df9so18210637b3.2;
        Fri, 04 Oct 2024 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051931; x=1728656731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTBmxJzVIGZHt8UKhn9MdR/m/EDycCw6/mAWvf9msk0=;
        b=WzDMX7V/iYxCJWG5o7f0PQETXF2JXkcLPECBB5qQwx63eiCEAhZyesSRVI5aCMSfvw
         VqeG3G42NWCscWvoGQc/8oevL2Idb/mknyXfpQ29/nt5K2dmHpK6E+3mQv2OJG3jpzh9
         mms1XVOXjv+S4fKKMFCJi+AOhQdxzwvVIj4RGlFgt4s6IOk4X2s2m3cF1kLPl0sA1EQ+
         Mrtv1hi3OEsjlzjQTylUuDz0iBrzjybSfMnToaVfwPKKlL9EAwEttJ4080UgcPxJ9goQ
         9dpGWcytg+APvqbk3dzwc0xe3NKRiXLy1W2oufSWJ1zhbScy5KMygKHucc/aBqsqrBrU
         F1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbihxUflaHp3xHCSVNIQYYzp6ky4XSKB3BWFw1sobi9NXhijr5NwXk+mP3wlfqJ54l90p7RqDUrAAW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNtQMIu2Uw/CclWcihuX8AMRl62T5uXzmWdRWq+0Ldz4gkHUSI
	ogKnf16kKXxqTQOHMX0FZiyzArcnIVRnbXSwPN8Si4vFiqSFxQ/uWE2pKQwSY94=
X-Google-Smtp-Source: AGHT+IHjVG4TNQtHpBJmDhgj784SrsZlsOMqQP68WiwdKti0mBidzBn7ludNYYQriOOH7YfROQqy1g==
X-Received: by 2002:a05:690c:6610:b0:6e2:a962:d80f with SMTP id 00721157ae682-6e2c6fcb63emr26493637b3.8.1728051931359;
        Fri, 04 Oct 2024 07:25:31 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb7ae1sm6661407b3.24.2024.10.04.07.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 07:25:30 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dbb24ee2ebso22651457b3.1;
        Fri, 04 Oct 2024 07:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIIuc5FZBdrbp6JHYWB51f7FCI4Si9pM+EHbNRtD1DpQhuaoVbR4RkCXKgnvzKdy4V+qunHifJYg0e@vger.kernel.org
X-Received: by 2002:a05:690c:500a:b0:6e2:c3e9:dab5 with SMTP id
 00721157ae682-6e2c7036f5cmr24221087b3.23.1728051930493; Fri, 04 Oct 2024
 07:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926110718.20519-5-wsa+renesas@sang-engineering.com> <20240926110718.20519-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926110718.20519-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 16:25:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYGVAU97a6G4ngvwvS-dFkie3fTrRFohwuZk9drTr+VA@mail.gmail.com>
Message-ID: <CAMuHMdXYGVAU97a6G4ngvwvS-dFkie3fTrRFohwuZk9drTr+VA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: lager: use proper node names for keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 1:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Avoids 'keyboard: 'four', 'one', 'three', 'two' do not match any of the
> regexes: ...
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

