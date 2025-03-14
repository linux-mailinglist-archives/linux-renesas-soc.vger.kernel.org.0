Return-Path: <linux-renesas-soc+bounces-14369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D94A611AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429801B6097E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FA51F4191;
	Fri, 14 Mar 2025 12:45:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF11D540;
	Fri, 14 Mar 2025 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741956341; cv=none; b=mJZFlMINIrRBWL5E6RkUpNRuG2bCZq4P97K26nRjUsp++xbBIf+9Ty3fQjyv8FN1pMwp2KUW7GFPE58dgEgFo+CqA9RIaHWFUDlNfYp4Jm+qjeTgXcUUTWZAIgLYj2E+OYz5fh9BCHYMFKmwRv6BBmvciyjcveyKPK3gE7ht1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741956341; c=relaxed/simple;
	bh=BK4N5byTmYwxeKm9do0boEpRIRlAppHpvxOCullTRus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrQ0DGygCQ3eXCTzIDn5OCTpE4Tx4b+BU7vOYa/7sDqV0hDDbY/MmtOjSWAGZI+PHwnxvgpEnHgbzeaRY1RItDRmmmlsfsSSE7RGhNhi4CMx1TD08gv3qEwcg552BOPk2W37JB2tETHhpyCGvP1TP+PK8mEKkvIpiN0iUWebBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d30787263so893446241.1;
        Fri, 14 Mar 2025 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741956336; x=1742561136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HD/JI9UwYHhsycAtRktaBt8bdYx866iu0zPE3z36whg=;
        b=m+pE9jF4p1VcXfSB7BFodil56zc/bzEXmx2SQi1gBa1GycQIHm9xGIBi/EiQQFOefe
         csTspUnK148LGYlqYQWydJuZJn4cWWtAYfn3On/n5wOqMt4PcOv/WZy77UHNeqDgxeK5
         8gWhzbiZWfKXsyQc6/mxoxl2iSVxop5kiDizVKXKS83Og1h0fHFWSGtgAQV0gMhhpLDg
         hwJmjki3IamhELxetk8aH/EZt4hd5TconbnsIh9SatQlCKO7ysmoitNwwxY0H6X/cObn
         IMSwKzxpOIXkMtJPGr+w/OLlWj6LK6d+1Gu8oVIOWjmTgLLdqIeWqhqKzNyNT4anWS/+
         TokQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHZvxBeQ7ZxKmlv9pzidt6VQxhrV6FfV2SNtsPpxmhFVOwbYx2rMJPi57GnSgnfh9g+9VB/JkO7sSE9TiW@vger.kernel.org, AJvYcCUpWsxeRqK1T+87QxVTp8/vLQzs8f1QP4dZEMWgzGndFkom8je2XPit80ePTaQs2lCICd6QjygswTY=@vger.kernel.org, AJvYcCXTu6E1VrZ85PmYZssMFLBYxCrNpiV9SomOM9zFIYjQJokYYjfXKsRtuc/4+WA2lhMEi78xtTeUp8Cg/SNOM+fY7yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlMpALPCL9rnPAZf1fLv7ioGOiBhybWZPhLBpCAjBc4cg6BzO
	cg+F0Wv4d1DeQTaSmvJxNKu+o4QLViEshmO9LoKWe+Ak9BnJR5CLrrWLXjpuZ+w=
X-Gm-Gg: ASbGncsNaKa0X6f+3czMbtC7tirmjn4Lcyi7QAJ9mzlz2QZCvJ4ABicF2J9Nn6pO3CM
	3PM4GoJW8/7NIDF+hTtEHghQuEcE7QjwdD3G049Z9dFZB2F/mVByD3eAUCQlp+GnS7k3D1GJYoL
	6WrtZG091gSb53S58Jlo33bz7OskyVAQN8of3yCGh+7l17+Y5lmPrv9Y0Wfi9HPnlw3zHYmTZdG
	hwaqKc2mMnxZJ7UXQGBgHpHiYVoph/O3/+bhQTEdblQF4TrkBnT3aw46f6cDyA/VqDJBjN9ArvD
	bhqcgp8m3gz/OMMmBRqKPfClJ2Me+lOYogOR7e8ShvrpschTZ4vGojRAWEaRd5s85oqqrKaTNnd
	N/W1vVG75aAB08VJtAw==
X-Google-Smtp-Source: AGHT+IGCLzGVAb2Lh15HdBzdbdeXH3JqvpUi3j7DH6TnIHMUVuSfjQUgB1fipEGFUwxNM9Qrv5ImWA==
X-Received: by 2002:a05:6102:509f:b0:4c1:7d0d:a48c with SMTP id ada2fe7eead31-4c383230108mr892969137.22.1741956336605;
        Fri, 14 Mar 2025 05:45:36 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90dbc93esm524129241.16.2025.03.14.05.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 05:45:36 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8670fd79990so850829241.3;
        Fri, 14 Mar 2025 05:45:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKtul9FbCPBWIs5Sa8sybS1T7M1jwZu4zLLVz/w5dz1yhdlj/lQ5c3fnM5y4vv53sRuUPJuQkj1fMa87C2@vger.kernel.org, AJvYcCUNUYi0PMhJ2pjAUjhXxDW8OPN71jEo4V1BHox+Lel/EWRE0GEcSefisfgH5D424zYGs8H+/OzdItrwT329WEwVvaA=@vger.kernel.org, AJvYcCWpQ6D6Gw9PRFfWV7QdxK5oH1MIy4aJSfuHLSc9zGDTGMG+ey/YpGMClOtls8C/zXMQfQSOaQCQQgk=@vger.kernel.org
X-Received: by 2002:a05:6102:80aa:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c3831f9b0amr1281433137.19.1741956335951; Fri, 14 Mar 2025
 05:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250309211402.80886-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309211402.80886-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 13:45:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYpy9LPVher4WUoT=nnUw0ktYTm+uQXWJ9CTgQ-+1S_Q@mail.gmail.com>
X-Gm-Features: AQ5f1JoE1PDnt5PmhECDRD4p8jfQ-p0lv7roAnGfISPIwnb2DkwFMkDDT0-KOJI
Message-ID: <CAMuHMdXYpy9LPVher4WUoT=nnUw0ktYTm+uQXWJ9CTgQ-+1S_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: rzv2h: Remove unused `type` field
 from `struct pll_clk`
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Mar 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the redundant `type` field from `struct pll_clk`, as it is not used
> in the PLL clock handling logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

