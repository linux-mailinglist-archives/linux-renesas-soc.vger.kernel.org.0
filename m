Return-Path: <linux-renesas-soc+bounces-23572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55FC04EAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F75C4E9FF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C382FB092;
	Fri, 24 Oct 2025 08:01:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952AD2FC02C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292907; cv=none; b=aE6xLRXekAPYKnIP6libXZGu2nXwmq5TFtx4xc2oXcvwmmUfNgNJ4q5wRLFOmv2NNKFXsJgtbtDPPBegkkpu/se2qqvHOFxSIxxSwyLE/39ouXedgxycBgvCDhz0vetuYHLwOn8WS4F0TXGNy6UPA43lt0VOe0mik5R21gygGT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292907; c=relaxed/simple;
	bh=haXerQcA3HaYtUIl4/PZ1i9/1Px3bakR91vnPlzpbZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtL8IzckO6VUF7Aud82ovXVhzGePY+FeHxZIMQUxaN86DqT1Dd9F4cUkc3EwjNELKhYIESWJXoTm99Nc924uDggHd6tLm8WpUxoXh/31gEPsVjU81lSYc+Jx9QVPa5Wi/kFq/dV7Aq1NQjtmNJAPq6zZAq6H0NtnNDLiOcbDwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso1081954137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 01:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292904; x=1761897704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbuokl4czKvaoy+RAtT8vLd0ny6Fv6b+IGMo/jRBfrQ=;
        b=qLRkF2pJwDV4yfwgcI/cD+DQRV2mqnLXqhRsbNL+eWPX4DaRZuwj4Ke92+KaAyY/1e
         WnB2IwRsg53aP3+pl4fNkwAxOMeKGOkeouV0fFPnig90BdQC2WVb7HRIKn2+dXKvRqvq
         i+Cxx85VKzkVp1sQkloBUc1wPwmryRp4V31zjDQqFyMCK/RehP8ynqWPiQs9iK8BDDhB
         uoHQEkh/pPG6+SXuq7Ch8idM0GPZbaluNAgOjKwIztm8GdJHxhZLjWErRGm4DgCo0TbI
         s4EqBr1y1U62qj4gLU9++OkwpCACkJOTgz9X31RJFk2E4LrWFwlF2YxEOVEJs03fP2Ir
         zC9g==
X-Forwarded-Encrypted: i=1; AJvYcCUrDziCVvrtPTTylTGTb/uCQ9GhYsAiO8qpaS9ca2CxmPruMbUngxkITNaw3oqIa+/8zRFFx2jirKRCG+22NAGJSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZuB02xdE5z0Cfg0d+uIwU6Bgtj3eFhyrDIS/Y/IllBO4lNrTb
	J+6LgC0gZypQ3JlpLJkqVE9UHGXsjMF4BD9PHK1O7/e3LywRvIGNfzH3OM0fiihi
X-Gm-Gg: ASbGncvFXjz8cnxuCWaYGu47M3Si+eqCkvOs7w6h91BRcaWSXrfZP6mheUrAkKLEVpN
	zgcJuI4OcH+VAB1NkhMk+IerB/bWlkbaaVDxuWx8XfyTKnMAlvG9AMcyo6mkPCfeejdr5KReRZi
	wjPbVFh1Kgax/msfCJkY184Eea0OnSNsZgtBeCC685yObjxavON+F1mcCys9gfDlhVhCfRYxJcq
	obylU6hi0zoX6mEDpw3BK2fjS4Xtb4DemOllH0WZaKspWAPmDmmdRY5rmiQIvDLcbGRHTAhveL9
	1VUcyN4dHsc+QGAO7Pcf9XcUUNZOFaPS5ffxp6vcBm8chYdRuM1+f4hIUzOyeRksj3fIjSkx1rF
	LboEZLjxtJwb9teZcOWDigbK0W33ttTFwKo3tpv3DXz8j7jmmZZX0Cq8yh4OIil+TNDEwABgLe8
	OFw5koQG+THPl0TBDEPE8YgSdlSUe9xIiI3j7fwg==
X-Google-Smtp-Source: AGHT+IHFTEnm/N6aImpOCfjcAvLMG0zkdR7UPN7kdV8lF6MSi+pPVuS9Des/h3EsjoBCPTA0N2Hl5A==
X-Received: by 2002:a05:6102:d8e:b0:57d:9305:63db with SMTP id ada2fe7eead31-5db2e479240mr1561072137.15.1761292904225;
        Fri, 24 Oct 2025 01:01:44 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c77bdd6sm1827320137.1.2025.10.24.01.01.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:01:43 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso1081940137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 01:01:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0AKwXMyf9LmPLocF3cPjOEv7YO7bnZdZqOI1gPfY9c3e5ZFj6eRXp9kvs/B7g+kENa+YQCV5eUNzTAw81TrBLcw==@vger.kernel.org
X-Received: by 2002:a05:6102:c49:b0:5d6:5f0:3f88 with SMTP id
 ada2fe7eead31-5db2e58e682mr1680224137.35.1761292903035; Fri, 24 Oct 2025
 01:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com> <87ecqsn7jo.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecqsn7jo.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 10:01:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCz6OZYbKR8izDRe3=dz_yVTj9AhFmHG98WETaeknmZg@mail.gmail.com>
X-Gm-Features: AWmQ_blRNb9opWlPAtdUuV4F0M67z94Nk8rxY_eqKk-OMWvzPSxvxuGJgirtXu8
Message-ID: <CAMuHMdUCz6OZYbKR8izDRe3=dz_yVTj9AhFmHG98WETaeknmZg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: remove unneeded double quotation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Oct 2025 at 08:22, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> It makes Kconfig strange. fix it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

