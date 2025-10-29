Return-Path: <linux-renesas-soc+bounces-23832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5AC1961F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 369E74018CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225B2327798;
	Wed, 29 Oct 2025 09:33:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0B232144F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730424; cv=none; b=WuqK1+uYt+TPLIx8vrlL5GDxZdSOAbZWtaQ95hyLptO9w2u3V2VsFarkZFZLr54IZJjIjH+Uu9k+mDNhOmBXpmmRAHnt6gC4ysD/O40BWbauKljCXiM6A8uoW6LmKDRmnSHs9ScSb0keiNgnpyKSYzUMDajdFNNqORki8N+R6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730424; c=relaxed/simple;
	bh=aflcx8jLILY+2sdFq74hVkylZgAmv9N8piATLBVIfpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pa2s+od9edV5G+149JQE4vLFUp90lUv+zh2cykcIYUhW9gm/yRQGwaLhhtAWuGfS7CJ3mWnEHeQLn+LSXMpX/Kt8YPMH5PsSEYkfZJg9yvMUzkNBhvAzTbcoyFwQnl60UZuPJfBS4DfgyULjlsk2EVZ25yF0rYY+aUNWvpSPj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018e9f902so6102203241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730421; x=1762335221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30syW/IitxNwwmQ4AxaTICD2pH9pK+LwP2BddhlDAug=;
        b=nW1MSDdno5Jq3U5CrHNhBp7oAlwMkIF6Sfy1GmEHifFAPmuGeaoU2NovbxmgToZpvj
         pRb3/XgPtZUMkvI6u9ajVN625mW1bshx92xRT3zZSVbELuT5QlOrYlJnAZbhQQ6OaUpq
         N07TIH9lWuMuFA9F432bBxDG5xPYuf6RI1YJUWeJmi8TU/kkxSM3/QrOzlY2AhYoyxeh
         OYqSRbaU5VSbNq1Z4lp+P82Nsr2FhXlpDZWC++sBeLG2QQh0O3QWNb4P6wmE1G72Qxm9
         RWm5k3OXx4DhhCV7znXMpE0cyS/YwFsVtHioFfqCRzlytScuLsfjVoQ3U4pXbIpoxdMR
         U0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvYwiTTr13WrJm9OY5KDsLbbyJxPqxcOr0cSpsErLfdjmsr5ZnTnh0doWJ8fCRIjHtMD0xntr06fq63uBlDzEbiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbehq3tMGOGZa0Yda4zo9TdMRmeUA195MiYXuDBDFGm5r5/pUV
	i7RfM2mjPXLGR5mNrdHF+dvwRA/Np6XbsUGFv95Aer1f5gCGRs2zPbhG1+eUbN6z
X-Gm-Gg: ASbGncsTE1N2wPGpFavQ0CyGhBkvw2Kf7+Bb92aTTXQwtqoV2X3AfCIsGs50vQupFsD
	5TNnDdsIlGrTNiw/btNtwuszsdFHG+Hg/mTcxF+zizb1Un7f1sOET3gP3gx+m+yFcmph/u81XJ3
	nQBFv///a652G/j0V+nVAg1gPZqMs6D9PI43On+j1HjfHHvrMfB9JiQIaSReWjMTbdgDoS4AIOr
	fHjS+aS5zGjjp+H3tQeQCajmA2vAPzjXQbRM8FYldk3QLkLkefwN8WEjc9DRyb9maye7dp0RxB/
	i+FmxXwWmv2iYDHhI6Y7bnhFtqcMf7gdAS0/ZV/DwW6IdayA3lfI5iFortnODSeK/KzqTdqwQsy
	Yg86Xr2TGDAd/SAFzWebVwGfYH5e11MMEGl1bDAsOTqZlR/TT3HosGGGcSzZxub8/49NJWtLHZf
	vMFIfrDSCVl6J+jD5xTXXQRwgy9uWfUVYk/nKiLsN7b6UJoIVy
X-Google-Smtp-Source: AGHT+IEiEMMYAZ3iNRrgwXBk0AG1TimWcaShG+mQISpoUGU5fxvviOl6kD/cCTHIF/DOx4v9uw+05g==
X-Received: by 2002:a05:6102:3e20:b0:5d5:f6ae:38ec with SMTP id ada2fe7eead31-5db9069164dmr582858137.45.1761730420732;
        Wed, 29 Oct 2025 02:33:40 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c4050425sm5146590241.9.2025.10.29.02.33.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:33:40 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-932dfe14b2eso5844372241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDVbH9Mot7aANuWEhDyHsTeDzPhjYxWkiQnJhV7UO+wGvkTpPO9KgXesqV3GvG7qDw8s+6LJe+qstM90vY+SMAFw==@vger.kernel.org
X-Received: by 2002:a05:6102:549f:b0:529:fc9e:84ae with SMTP id
 ada2fe7eead31-5db9064ee34mr611527137.24.1761730419708; Wed, 29 Oct 2025
 02:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
 <87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com> <176129066419.661728.14767654389778601283.robh@kernel.org>
 <87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
 <875xbyusu1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xbyusu1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:33:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+B2k-mcEvDikbRb254JsqG+U45OKmz0w+UDJ8453A4Q@mail.gmail.com>
X-Gm-Features: AWmQ_bk9NwGRU1T-dqH14hulll-ihhVFBceFHK_-cX100g8oKAgZ5mkQIDa3C6E
Message-ID: <CAMuHMdU+B2k-mcEvDikbRb254JsqG+U45OKmz0w+UDJ8453A4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 29 Oct 2025 at 07:26, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Hmm... I can't reproduce the issue. What I'm missing ??
> (snip)
> > You are checking against the wrong bindings file.
> >
> > However, I cannot trigger the warning by passing
> > DT_SCHEMA_FILES=Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> > instead.  I only see it when dropping the DT_SCHEMA_FILES parameter,
> > and thus running all checks.
>
> Grr...
>
> > If you are 100% sure you do not want an SoC-specific compatible
> > value, you can fix the warning by adding "renesas,mfis-mbox" to
> > renesas-soc.yaml.
>
> It seems I need to.
> In this case, should I create separate patch (= for renesas-soc,
> for mailbox) ? or can I merge it into one ?

Changes for .../devicetree/bindings/soc/renesas/ go through the Renesas
(i.e. my) tree, changes to .../devicetree/bindings/mailbox/ go through
the mailbox tree.  Hence you need separate patches.

However, your v2 does have an SoC-specific compatible value, so you
don't need to change renesas-soc.yaml?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

