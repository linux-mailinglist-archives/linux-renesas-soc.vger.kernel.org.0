Return-Path: <linux-renesas-soc+bounces-28706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF9AOTrkpmnGYwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:38:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB251F0630
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9327306AE1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED8423A6B;
	Tue,  3 Mar 2026 13:28:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1F48CFC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544524; cv=none; b=Da5M0Jxko6OMbj0cWfaVKGwpbpTwq1eFeN7s4+O+xK59h3AYs0uiu5WJ8+VMg1dEKqanQIWUgo8RVNllTV30xDJLfKzVI6B4Zt1YreXk3R3bm6RR7NvxQfyQMvzxZTTIzFr8oEy5sYpvIEGEEU8KBwI8/tCmRV7S4S55u/cUbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544524; c=relaxed/simple;
	bh=0Mx80CC1QWM3bvGMYo64nUaV/drH9YWwIQYt8dBOlnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBJYNAvQE5Kh+XImdTX4iSgZ1OocC42U7D2u6ooGVXg+iEBBLvlkzPLBY00k09c+AA39Ceve6jBhPC5Vkq4hh2W2oyA7K6iB2wxcXnNybxEYSCB2hZbkI5+2t30WKURcvwV7F6BxK4ipXaYJNS44inlU/g87UsJoCbh8k/03NmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1276469241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544522; x=1773149322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDxJiIrxQC92hbeNlNOe8Nj98YN/DDHhyxVEaLyss1E=;
        b=OqOMMwTHB/wkV3DGfmTPvR+Mfub+/CUtVbRgqxXWJ/0tMzzy/93m3QTyJY0Ji4lNYW
         SsWKUvxJOV4pa4pendheHyn6ucJnTUKNPChUO2Fj1piPzLQkPHols/iEj19tNWeVw8J9
         2B9wUgd1N7KyIa0WVQroYG5wLC9t6fmkAMfwG5SBC0bA8uPYsIcUTLAzz7h6eqMHMMWn
         7Ju4A18XCSp/mTcXn4fgh0+HqdVxlJg/Xa8Y509yWw282YigLT+jxN79t7hM1OxPiWFz
         AwWnpLWKstmGYN+dQdA5TXuYTPsxAPRqy1DHX7WPPzvXd2O3gIvJWzZdG2qN1KPekCSS
         0D5A==
X-Forwarded-Encrypted: i=1; AJvYcCW7I1nfFWiLVIN62rgbzkaYFFyB/AWw4MHFVxm4+BshtUnf8mfnNxoqbzNnvLHEoS6Jt7FCZNPQqJLw9KVSnY125A==@vger.kernel.org
X-Gm-Message-State: AOJu0YykNRdcS60Q9uOqNi6wb7/TS+8hV+ILRAqUHu9xJBUOBze/uZ7J
	peVNWdxV7uuKYeAkwa1QY37RQyi0DNDo6wUwIuXt8OeoCaaOAJW0Il8l93ge+83q
X-Gm-Gg: ATEYQzxGhTwa6vFY8SnOGy0qxnArlOpc4ZbAQUsqhYf+inC/GWo9AeWsP1XnRhPLVhl
	YBstr/+9wGt1lAuV70NolnIqZ7kRxSjgInR7XzWxy93PeOGYnTPNZltzcsSKrwhWQO0/a5Wjms6
	jFPrz1ReHP+p9wW69pb/ICH9jv2Aw6RQ47bz3cWaMV852SRh2u06KJezEBRJ6BL9lCsQP4wzSql
	tGswA8XhShZ5kNlZ3RjKERl0bsaimaXzSSSyCh7de4jsz89KL7NwJ4PIVS0a8zp0uzpC9xu1Ubf
	GppMQMbJ0pXvaiKVqnTVx+rUqmISJOh5dCN68SCAyqdVuLwYk8xTg1rJKru9fTFjmkd/z4ZVCfz
	8Qj8KqRGCC04VLzKvEYS/o61sVP/uzXZcpW8v5dqRM/fCRH9S6Mkiisfomyz996+dA+32d/xgIz
	zoIYDJo8IbQmOhpWFkN5Ot9CxXckJ4E9AY5kvu9PPPP86yDn9WUN3jYWXTV8H0
X-Received: by 2002:a05:6102:511f:b0:5df:b5d4:e45d with SMTP id ada2fe7eead31-5ff32555575mr6622855137.33.1772544522502;
        Tue, 03 Mar 2026 05:28:42 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7aeb8dsm16784175137.2.2026.03.03.05.28.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:28:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dddb3c3f0so1468865241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:28:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrNcoW2Mz7WJiVCBG90D8dlsoYMcvGshKHTkR57xln83xzpn+LSamvbIl6TBomVL8WsU5IDrKsaBHXxjWKfEzfvw==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5fd:f14d:4cd6 with SMTP id
 ada2fe7eead31-5ff3254b2bdmr6188901137.27.1772544521227; Tue, 03 Mar 2026
 05:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
X-Gm-Features: AaiRm53fCUjLUZ6px0BRfJJuPYdPSrAIEkOdRkY6q1dq85dF6GGqE9pEydHG_cc
Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BBB251F0630
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28706-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.662];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC (a.k.a r9a09g057)
> states that only WDT1 is supposed to be accessed by the CA55 cores.
> WDT0 is supposed to be used by the CM33 core, WDT2 is supposed
> to be used by the CR8 core 0, and WDT3 is supposed to be used
> by the CR8 core 1.
>
> Remove wdt{0,2,3} from the SoC specific device tree to make it
> compliant with the specification from the HW manual.
>
> This change is harmless as there are currently no users of the
> wdt{0,2,3} device tree nodes, only the wdt1 node is actually used.
>
> Fixes: 095105496e7d ("arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to arch/arm64/boot/dts/renesas/r9a09g056.dtsi, too, with the SoC name
and part numbers updated, and

    Fixes: 7db958983c8dd14d ("arm64: dts: renesas: r9a09g056: Add
WDT0-WDT3 nodes")

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

