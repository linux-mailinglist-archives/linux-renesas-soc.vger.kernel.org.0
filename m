Return-Path: <linux-renesas-soc+bounces-32207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KOdIFBb/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:28:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFB4E5E43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2F27300AD61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9847E3C060C;
	Thu,  7 May 2026 09:28:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE553C1995
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146113; cv=none; b=BuQtlt4iBUYP+KFuSkAZflT2qb9xopC7EdkCENHrFShVwQg08SyXVSHC2Q3amqn/CNlhXGFaQK74gO+lE6yg9K8A4yxQ70mD+IrmS+luu7WZLI2NSalpEg3xzNkXNuOEiztaupwjk8hU8bVgx0IZUMwAgn7P1mfz9ml/6Xwh1SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146113; c=relaxed/simple;
	bh=IwrNVFKzSRTdZ5JveLi918fTr6rocBDAoIvz3oaLMZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKKkzotIzIKHAvZaTJgUpdpTOt7FxA8E1BSkeSLEKhf6+XZbBE+3E+H353VLanwlYUHqC4nIDOj3daFA5gY4S5+t+YY+11+++mfd31oziMjEtXYfRk2po0pB5l+Z87Esbqm6gWPAgNP6M2jbgqkSpGF6mOqy9Uhvq8YuBlmqms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcc9b506d9so522663a34.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146111; x=1778750911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlQwLkoJNNdnPrw8knAwIybrcJ+s/HKf8ofWJf6H5hI=;
        b=WxA1UewBRvm6bq+CHlPERFRjZjuRFLK+gZiOgXqPi4EwmIu0pe69gZkkUubt8oMxl9
         kwUZKTMbP3XDsdBszLY1u2mrMde3E6gAenw4Xqjco+Y/gpKeeY7uhnQ82464oVWVN4fn
         V+nCJCkkZORNSyce/XSsgUXktyKnTpKY6NeMPL6xWFiZHZtDNozv83eOJmPSAhOmkCyL
         f3RGMAoqrrYJzZApi8DJlK3XC7qoY7vhqOrZriz7LquUAIUSRipxhLtrv9dU4RshS0Ut
         JYR7I/BsiadPnXptz/LMZrqpemNB+PX3ROkdIaWTBwa9fK/EXYzCoEj9InIt8GGvwooe
         et5A==
X-Forwarded-Encrypted: i=1; AFNElJ9rHnPbmM0qewllQDT5h4MeHAPRr9NT5Icj4bYaWtKPDd8oE7Lo0LKg0eYptrGZLik2ZhILa1STrbI3zR7cf+sNGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0VMc48M0/zSMUrEftE76sAhzYGlY2VKz9vhT1PUvGhx/ovLr
	S0SLUty3CY6NemE/fFuJAOLEy+cHIcEARkOCYNbmDXshavNn+blvwukMqUZ2LwRYah4=
X-Gm-Gg: AeBDiesUYSzNsBYEq3lqeVp9WC6k6344VgGhH7e/L/B4gYIw0bMeVGj87UNwbDYHUyd
	NIVfDWTpD11ApRxMO2G48xo7hGBKr4R3xB4fQ51X0E3cUvBr+tqdB9Xir9nxM/aA98kYN+owbOs
	pYmiFAwvibw3rhe5kCXnhMSD5iUaWQslTu6m3pHnUIy7qp+1q1me+FFrhsf+byloyTD9YQaRjDF
	nt4V0k7vRR28VI73FOdpZLEIuKMThcp7tq92ahwmpR6NpUVZjUsTmqKVlXGpm3Bg6t8MhPrFXbY
	OCO771eSJPosxkZVFRIDSiP+uafXRCf4V77DzSTqVzoINmDZIE/x6nHhIFmoaO489++NbEy34PY
	dGEAQiRZwmzmK1HI8Z3mA1ccmP22Fh5bQ/S77V0lzLftrOehc7hbyTJr+C7A8bH+NhEVWKOMaD3
	HUJQkHUon8EBcZ7Cniicn9KZlYcyf2qVM5xRpbheJuhXnHC2fZeuYUAti5IMU1V+23F4PKYZ3KQ
	xEK8OK4bQ==
X-Received: by 2002:a05:6830:910:b0:7de:5612:d420 with SMTP id 46e09a7af769-7e1df0fc604mr4314381a34.18.1778146111039;
        Thu, 07 May 2026 02:28:31 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decae680bdsm14063859a34.27.2026.05.07.02.28.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:28:30 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de7c57b52cso497526a34.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9r8IYba1R+zf1jVpK4I08BKG/e8mqiROCA4116IvGADGx8NH8E3UxWtyVG7Xfl0iNZZsKeFmPWBsi5OTHaK3gWFg==@vger.kernel.org
X-Received: by 2002:a05:6122:2a48:b0:56e:f1d2:c3ca with SMTP id
 71dfb90a1353d-5755937cdfamr4080066e0c.2.1778145712572; Thu, 07 May 2026
 02:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772468323.git.geert+renesas@glider.be> <10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be>
 <20260313215912.GA3415767-robh@kernel.org> <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:21:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
X-Gm-Features: AVHnY4K1hvlIze4Kwir9AQf6-zlk9HJ7JWrXBp9drztoS3rJo0JwuvmBgBmS4rQ
Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
Subject: Re: [PATCH 7/7] soc: renesas: Convert to of_machine_get_match()
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 86BFB4E5E43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32207-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 25 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 13 Mar 2026 at 22:59, Rob Herring <robh@kernel.org> wrote:
> > On Mon, Mar 02, 2026 at 05:29:11PM +0100, Geert Uytterhoeven wrote:
> > > Use the of_machine_get_match() helper to avoid accessing of_root
> > > directly, which is planned to become private.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > This is an alternative solution to "[PATCH v2 8/9] soc: renesas: don't
> > > access of_root directly"
> > > https://lore.kernel.org/20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com
> >
> > Greg applied this, so you'll have to respin on top of that. Next cycle I
> > guess. Unless you get him to revert it.
>
> That was my impression, too, but apparently he skipped that patch.
> So you can still apply this patch, too.

Seems like it fell through the cracks... Will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

