Return-Path: <linux-renesas-soc+bounces-29418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGteKCQzt2lHNwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D7292D94
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 578343004D28
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 22:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E2F245014;
	Sun, 15 Mar 2026 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NWCqufbm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9B4FC0A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 22:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613857; cv=none; b=E+4ab7AmR6rvAqwqV4mp/ysO9k0yW4GQInGQtpby4yWtxuQlbUhLRUzeqJCRLBRUQHMsNngxR/+0i6hLxKtfO3WYDD8gND/eAwpnVhMJCC0IseyZvySMDnMscVJADeQdVZ3bCgyskwkbvKWkEwiUscnabTf4rUZuu+RmMcwWzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613857; c=relaxed/simple;
	bh=FVR4MmoKb6ALDL9+KAJ3wXdi4xneBjqVC4QwyDcJGpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGYmrOUdjQOyfhSXeQPalgHeU0UDI8i0aeeWDZcnhbYKdLWDTRpGzKgfu5p1vMJrM4g7cgzk+dynn2pp0MGc2yg76ZEHb9Y8ll5msVq/Y6CLadVyeMPHrDIn94Kp2pb/RTnwRYfnf+6onSxKBSVFHjjXqMOq3N2ixAzz/vQz3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NWCqufbm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439d8df7620so2853878f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773613854; x=1774218654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0wCfuC3ECshoO+Z3qqmqugSger8vtqn7dh2K9B4tV8=;
        b=NWCqufbmsmRQuEQJlSQ08DvHs0FNaakBPV+N2ng6tGaZVEJBDNWj6hgrpgxxDMwS6g
         BG6l4LD0grjak35yCPqF8C7BGAjFQUzWpAuGtqg4zyJzduBD4uD02cb/NoqaBbag6scH
         lGZIGwp4Nxe7pp4Bzr+i/uJ9HJIzvNhCLXcL4mHALUEaXczkNdvZAYw0a+6sTDwMeZl/
         fBwMF4CMrtKRFKGASpb42BXmrFD3H3P2FAGOsc/uh7GeCQ3E4+5oj8YgOr/V2T7kT4A0
         3bt5irUE/UdKRuOr8/xyrG7Bbo3ZOwdnaLP8+bIypy9gLcvARlrzm5EXIAcF+CEUgDzV
         otlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613854; x=1774218654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0wCfuC3ECshoO+Z3qqmqugSger8vtqn7dh2K9B4tV8=;
        b=BWpxx4jxJwNJgMiOGgDC/DfZioEToPaJ7SuUCNCuSLWA1YaPgIviXdnu1f6kxVuSoB
         pW+TTh2Rs6groVW1KC2R76J9bqWLTy9oLNxiM4lL7BAqR163CbU6XH5mTjt+uFaYEa+j
         CBV9URbTx5lJKTRX5k5Klp9Swa2svXbsTCYXhNA4D3kr7tgzcc5ezDOV6+tEglRNhyrK
         cRJi0R83GT8Zx5Sp3hKyJt+fgnTg2BB5TZ1kQyApw8lhjLahVuGCSPsFYqJD/jxCod+q
         ms0PAvs4OdQhEqz2Hhpf3sWmfioXVEr7XMkI1daN8rOY3bHsW8h+FuW/DZ0/GgZszoKL
         AunQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8XFQDPEOZL/w9erk1/PqLzM8wUecTiSp6uaDFysqdvruNOBWW5jv8UJHnJMpqJ7kDUMDA+6BwYoXVGzQW2bPpwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNejG6qOVxQA4vwvB8QThP2ItV+LOl0eWjI8xmEGW+6vSTxYJr
	u0nWnNu4QYTMfQVG7soocns2etuypN5FYMJPWpNwW7uIfxZOUKRju3bARguIInqgjHU=
X-Gm-Gg: ATEYQzzU6Ow+abUo7zYw2qVVjI3tNi3S4y0psQUXq43Lyyi5+LoLPaIMrKrsF84rog/
	I7k6+ASym2LFiJDjpdnatgNeIiKbWbqxmG88YndSbGfyUMfEsyXwTdoAVJIQdb6Bpbkh09r+Awq
	MRYSuuqmMsIZO7UAznRmuO3eq3fTw4YIi2cxBTMXC309TQJad4Zq9v3Ox432O3WcD9+tZZ0vyMe
	aYWfhj0hDFSiXj8hC5NAPppjmZ/j6pfr05+zXLrkF+7NoPVoNuwsZguM9TaLG3kn2cVS2eAvNP2
	MHjVwo5uUPzx0JUPfLF9ARquq7+OnMkVw2OLg+4sRqx/M/Cdfti1CyTN4/mywkpwC6eqleWf9xK
	PsyFCDwrkDBFARBnkix3iPkChgqyWXMkzoLONR3YIsxgSkkq45n6MGsOF4A/bbeLqh8qxGNdypb
	CFh5l7j7YKa6Vx2M/e08P/uYNzwk8rcrA=
X-Received: by 2002:a05:6000:178d:b0:439:c279:32df with SMTP id ffacd0b85a97d-43a04dc0527mr19906875f8f.35.1773613853817;
        Sun, 15 Mar 2026 15:30:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm37195348f8f.32.2026.03.15.15.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 15:30:53 -0700 (PDT)
Message-ID: <efa673f1-b98c-4b71-a856-e76bba2b131c@tuxon.dev>
Date: Mon, 16 Mar 2026 00:30:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260309165946.3003731-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260309165946.3003731-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-29418-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 347D7292D94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/9/26 18:59, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Annotate rzv2h_sys_init_data with __initconst as it is only used during
> initialization.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

