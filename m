Return-Path: <linux-renesas-soc+bounces-31633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UADhFAlo62m2MgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:54:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5445EB58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 891F330036C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D123CF67B;
	Fri, 24 Apr 2026 12:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E13B894D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035258; cv=none; b=kERWG9fDgcMIi3Gvt+YD+0GYBY3y+Dyt3mNP5edZSVwR/v1eMU3h7RGZ3l8IKmpO/C4w/kDD4C7Bk6gepzftiHxb7gukRWuHBG2fdIY71coijYbsBgMTdjGjPMyGG68JfYlYkMftb7+G6GoiYvkuAcAUuCEKw76ojaGRxZmMo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035258; c=relaxed/simple;
	bh=RIGWcrqPm/W7/TCD7jMYjV/Dl+YYoApLyN7IZgzlGCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CX0EH1t64ptsjbZCbqXtywKRVR8UQUlU4wGXWusl6O6Oz9GZ31mVl9Dx0rH7TawqchmKM6Xg0WcRSaJrknJadmk08xIgq7TqAXnxJZdV5QvrwYyir25rou63sJ7FN88rgRa88cQGUaqUVi276EKJFQkIZb1GCtBTfJoZyX4BbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1035313166b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035254; x=1777640054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32ZCY0PEtQ809Zlj8YsVKi9yHfij3rjDtV/CfeIbwxQ=;
        b=VwEDobA02kP1vg0vU8ErNU2IuW9/y3CWqyKr53lbN5Dz6So77RynIoVpgeI7OZinSm
         HEEJk7vAmpfa6k9k54Ih/UIDQp90WOjjGmugxyHeFj2tR2oFzzkMTOputApQWtuiIuSr
         5/7mFJPnTYc76O5+ngYkqpyvaJ2j8lo4NUwpyEd79lW1D4FWVoGKK5jgZAuHaZVYsZHK
         uDoXnBUHsslyACy12ZEIgz9on8WM/nRunv53n4A3wTc4dAPLlCJtGZBAup272aL88jbu
         B97rGiYfU69fIGI9pCVXOiDKWbTIJIU3gedEZYKvleThS0yk+Bl/QJ5rxMnpHRTfciIt
         rL9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Ap5rujF7etrpKaZyw3y5sdrfwz6g9MKMJMIiep4KB1jPjlPLlaFP5yPsf4FjTrEKv82g7jy4xUzRzPD5rhUmQ4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTTl+L60UdYYIw7iCLw2bqa9XsJJAEd+w+bqO1ZZsM2xsV8YF
	XSCMxIqcv3U9SEoVWXkrq9W7unjZUmPWTwNm3qNLRt+jU8mN18RtYSzIS5rcfCZRFGc=
X-Gm-Gg: AeBDieu0OBJJAyeaHul07ZYFSW6pK5vqu8eT5KlGwGAqzvlRh2YhR69jRVF44abTuWw
	8JmLn5MiNrCE4/eyVzE3X0RF97cny25z1f+JUsi5yO4NMjeYiTTvJUnTuX9qdJFTz9vdR+SiDn4
	HHQP/6hHHQT63jvqlq/w2lfgBfqw9tF3FuwRN7FYKnNBwXTWpqmt8ImW6bTs0qS0Ol4Yb3hSYHV
	V2b0bONEcZQmig6W+49aaAJMj70jVwfPOag2YIyCSXBQQVMWVHVDav+0kJIrULG5dw5zPFC0sQW
	0V6urqlMp4Ac+lqhJHNhmddhVJqpd5jFXciWfDr8wTr49mLmQr57Q+JY4k824SlFeBBfnFcXTYQ
	G+UGjuXiXguJ3jWNUXG8u0UJdibsul7vYsWMZa+5FnQ5Z9O/iqUYzykmHUqYFt5u7h53IO1YXBS
	f5Qa/+UEYWy7wiXf2iLAV9xa9V9dNFDyQzPSYd1sU9VxxaX4ydnW0X+nTJcXa0AK3rUDf+w53SW
	YqkgWsHyw==
X-Received: by 2002:a17:907:a0d6:b0:b98:595c:a76f with SMTP id a640c23a62f3a-ba418888cfdmr1544231566b.16.1777035253554;
        Fri, 24 Apr 2026 05:54:13 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba523a90fa0sm705495466b.31.2026.04.24.05.54.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:54:13 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1035310966b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eQ94XuJseFct5d2bBL9B8YyM6J9+sUDxzN675ZvgJ5Pron2qZSX7UX87MNrLFKCaCA4W5CGT7YmDK2PtZklifzw==@vger.kernel.org
X-Received: by 2002:a17:907:6e89:b0:bad:6f1e:f473 with SMTP id
 a640c23a62f3a-bad6f1ef8c9mr215345166b.31.1777035252749; Fri, 24 Apr 2026
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:53:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm6zEdnCPNejw4T2ojw5AQP13=Cw0BFOGk17WCaDWBnw@mail.gmail.com>
X-Gm-Features: AQROBzAYqa6zLLKihIs2yATB0Vd0SBTD0nqRpkIooGDUMXGBCVDkM-NMFLi-EYU
Message-ID: <CAMuHMdWm6zEdnCPNejw4T2ojw5AQP13=Cw0BFOGk17WCaDWBnw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r9a08g046: Add WDT clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D8D5445EB58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31633-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,glider.be:email]

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add WDT clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

