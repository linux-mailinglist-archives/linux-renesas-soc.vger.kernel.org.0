Return-Path: <linux-renesas-soc+bounces-33384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCVtADPzG2oWHgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 May 2026 10:37:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14D615278
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 May 2026 10:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657DB300381F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 May 2026 08:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EA13603C3;
	Sun, 31 May 2026 08:36:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49C37206F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780216619; cv=none; b=OVKV73kG4hI9r45RLyPAlRJhlYu4MhCCtSVgLcJPRirqUggMLNwGJsYOgPMHXltPcHPE1mgNUku/Ehp1oMkhI6Uj+LRkQepjDAf1Uow1xh5oQkqF9njboc650q3XJIoWXvtnxtD5dsGCehrEExUXwUDb+73xv+Yy65Kfxkt5Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780216619; c=relaxed/simple;
	bh=VRoCK7u4CxDAaDhSmUkIbsYdQb82r8KYQ5s/yqVlez0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbjrGQtx4a92EgmNUWQhqnYFmjN0rhRLZxiurTJ7N1bupoicH701dcO+eHebl2Rv2018tXTawCAB5U6UIwQFXZ1QBWIhonLmhnX6zj9ScYpAxpl+Rw+uYebUsZzGUupyHmJoBoiNPB8iLtR1vBNXjGTRu/UG4gB7VMDyRgNpw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59f8a140a51so162593e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780216617; x=1780821417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBvM2ORohpXQB4d5IQuHmDJKKy3F6iaCOKJvYc8ytZg=;
        b=LfwcmzCJIKAWX3D87/bTx6sX/xcfKX00oYFGxOY3g/2voYhzxxlox3NumT2DdYr1Lh
         rEm9XQvXRoQZikp+1RjTxXy076oMuYOylmcrzU3tc6tgISUkDv3+qDRAXxZTi1YflHq4
         2+h21H0M1OcwKg+djhFqUHO9MJfCN+AqZZkzGywDaxlZaFAUKtT4bcS5iC/PMZDwq7oi
         fPTCT6KfTRu5+x1R04G2TPd0MgVFlEkLILOG3gNtQXG3VeO8EQ8SNSK48NxLejwL+yRI
         B6hNtUOlpf3ledgShveqA9IOl9OkX+sYOz44AQEHtACZHLkk+8WmT1LK6+U32a130hBz
         OCSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BW3oAV29sRKZyQEngTGRNdXLns0pV2kz15uqtnOVErYlYLjhz2uC68/p6qGhYxsbIV17N4wItGIg98RM6eNjfXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GcfGpM8inIFRFmSRN/Prpq2pC+0WnlWvMcqA9CZjmA5QiuQP
	EaSRqSilZNKAZ9v+LceJBLfjbZ7IdIbhxeQ/OCremLJWpcO8CqOXRP0YVHl4JlK8
X-Gm-Gg: Acq92OH4/+cFuP+F3gkJrc90fHOKMrULqSsv7TBqWap8jWDPf6TgdUHSkM9f2rh4tMn
	MXXAwRBJ0LkTi+O6zLciPmPjoVvsS8+pITeReNwkqUASCn+IYrBKk+xGHD5iYMn4KcyzTb8cybY
	TUkiAe+G8SRBIWWMEK7iW+DqNRIrf6eT1f+gGLjlAqA11sofCryQ9EA3JUIiZQP+ADHj3qisCb7
	2pLgVGhAD4DcXFjLr3BZiT63l0xME1ZQbVocjtvT2rCQooOUwbc+2BAsC3sp1ATPUt7EUbXzSTO
	5x4TqlCRdMKj4XTrH+JSijARMDVlUTMkeGReaWiTmo5ydJQ86KsTxLvIOdKzsSG0O99zOBkP3Yv
	MvhshfrlXMcKG82WMMGR5JsB+xjicSatoPcwlBzGl61RjHJae7hEAH7DL3nq8QuzZElS+B5I7lF
	QrH+yU+7LumfMeEJF0+rwq8cnUHt4a89RSIm5F1/eXUjil0gxpUzH4E5qhNJZpOzeRZCvmgmk=
X-Received: by 2002:a05:6123:125:b0:56b:7023:1393 with SMTP id 71dfb90a1353d-59bf9b4480emr2441072e0c.11.1780216617073;
        Sun, 31 May 2026 01:36:57 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d4754259sm4472696e0c.7.2026.05.31.01.36.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 01:36:56 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c5a522d648so1279274137.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 May 2026 01:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wTrJVkPYkgmhGda+BAX3adOYCfd8TfR+lut7c56TtRs52Hiq+Ollrz11/tE2GQS+YgCkZz6ZfCE3WoOvl3PFoRA==@vger.kernel.org
X-Received: by 2002:a05:6102:5344:b0:631:4cda:3ebb with SMTP id
 ada2fe7eead31-6c693a257bfmr2158834137.24.1780216616348; Sun, 31 May 2026
 01:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-4-marek.vasut+renesas@mailbox.org> <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 31 May 2026 10:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
X-Gm-Features: AVHnY4JIRr68RiPmOxbgFI01Y083MJgBCtNRl2Ceai1FVE5g6dLCk5lLsnDcPaA
Message-ID: <CAMuHMdVcmFz0vr+YadbKOy111PgDFYCm6kgRMWjKxyNj4mxbWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,microchip.com,kernel.org,redhat.com,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33384-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: ED14D615278
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 6 May 2026 at 12:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 4 May 2026 at 16:46, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Document backward compatibility support for CS2500 chip, which
> > is a drop-in replacement for CS2000 chip.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

