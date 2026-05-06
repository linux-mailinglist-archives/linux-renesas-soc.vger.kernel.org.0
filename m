Return-Path: <linux-renesas-soc+bounces-32148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDztAiBk+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:54:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1D4DDAA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F76630A717D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33579480332;
	Wed,  6 May 2026 15:40:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E32D41B355
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082019; cv=none; b=hE415GAmQXBf3dyh0pKbSOtOT/CwFMgkhXTyuRv2Zr4EsOEuXroB4S6l+VQTDdxwv8F37KVytBm1Yp7oGrnXJU6ttVi0ZXaRnjwVJdDPffxChD9x/ajVul41TpxlzKQMGZ06vxdZSNO70HSy/UfFqhSRKuucnOMeviYc829vyjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082019; c=relaxed/simple;
	bh=dI+QbPiTrV0nI7jHaByfemiDLHOOCvJiT5285V2M4nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjVcxUZy4GciSE6v8qkXJuzbJtyPtwmfVW3eiMkDCdjVPno6AW9+Z/BfhSa3Wd+NIE9rn4zu0WZtL9ClKW/yuGLXxngKkr75QVrLJuTbPwuW5iRxLFy4McwavzudwpM2V1TM9slMahlhiXckRsFGwQSfv0gt5DLUGmrHVDhfhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57533363201so1229632e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082015; x=1778686815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3mUtVH4kNPrD9j0yhDaqQ3GCH+69t3pr5LYgrqB7eY=;
        b=s1v8Co/Vtxv20Tx3ukjqibTpkKZtyJpsTAF0sm9x7EGWSNc8JiatK74B7Lw2a0RfLt
         jhQ3mD6m0MkmK7fywsHMsIFuaEV4M3kUlUSd+IQqufAYlCuD+NRtFWDLhR4C5w8vt5dd
         z4n8nBwAPD12HwRFmNhQsThYIERhZBPrrFr0vtkuCGNcD/zGV6q4M1JtNTlnLEoQpuge
         NgyMI6erlwgz0PZVkM21lZEYqRAynmEuWjvtXGML8FLVaHn5XtmqE93Y0cEHEbOHFmvt
         wWiqLkPOQtqI14PWpmCgAFHk2wlaV6ouiS+rVxXENDY8U55UwZeDz7jh/SBXH7pWuqcE
         fOSw==
X-Forwarded-Encrypted: i=1; AFNElJ8p39J4WO1jXtvlQfMcL4/COJ/h9lPgcqCRMov2tczdyy7oGrIVchnUZR3t1Kcxj96cw9ZoppmnaZ7E5SkfPZPO3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJqgZhpXdo16O056ZrdYAg8piG2NjxOvIedqG9ncNpq4CftIJ
	TgIhhXVKPvkI1EDOY5ZdgqkJuzYpw7qD12bRco0H4QQtARXpSa8zxl9Szr9Vw9u4ddM=
X-Gm-Gg: AeBDiesYJBxYlON8zSNH1LZrgznG7bO74WaEA+ihodd0HM5+5hr7PFC85dgz+2jW7F1
	PuCDx8kMDk9iCPquk+x31D9zy1TFXZPDUiiDVls4y/MRM+m2FWE9g2E2yGlbfQc6WSc22C3jzAi
	F++pEvhUVJssAGm+zY5FhlO8FrYOGQsUKywiUrli3SjJrOpFuqQKelcELivO6CGdf8efMLKtF0G
	fEwvy2p9sOvf/WCsaQOuWYf87FRhXxZhghyEFEsRT2t0Kcqp2cM8hSAACRKfy8qjY3S7cFpUR0l
	keh/OL1c9V6BBn2E/EmAu+9DhEiRwkp+akqaYbiwb0I5lTBRY2nH/9jClWMOh4jEeRMDQT/OOzZ
	OAyNQTNLU9YBzmLXBzujJ1YmS3iUJH4qmu9J8JTbRcY2wA70NjB2Zdo5l6noM0LBZnU33194UbJ
	LzsW49BAmJ6ObaHaqGpefGOCVcV1UdPndd+phtz/WziOo/KTccCGihMiIM8/n/BXu4yCDZRBY=
X-Received: by 2002:a05:6102:f8c:b0:611:61d3:819e with SMTP id ada2fe7eead31-630f8eeff7fmr1848663137.12.1778082015158;
        Wed, 06 May 2026 08:40:15 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfddbc09csm8865447137.11.2026.05.06.08.40.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:40:14 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-62f404636f3so1186547137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8puIII2n3cqzx3qIH6AZSmPBSWvDXBCsdL812dSuZWo56G9qUE77QO/m1H18dPXTWu4DwNUDGKeAHSRaRoGJMdWA==@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:62f:39a9:ae67 with SMTP id
 ada2fe7eead31-630f8fd2321mr1675840137.17.1778082014035; Wed, 06 May 2026
 08:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:40:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhSUErK35V=3xH8GULG-PAwx9Q+g7wKU_N8LiK8QR0cQ@mail.gmail.com>
X-Gm-Features: AVHnY4LPLTrUreAXhyRM17hCvjJwDRZ_joxZLc8vOxQ5vxOG3C1P0LUHhcJtdA8
Message-ID: <CAMuHMdVhSUErK35V=3xH8GULG-PAwx9Q+g7wKU_N8LiK8QR0cQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 05A1D4DDAA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32148-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The port and function selectors are evaluated multiple times
> in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
> dupicate evaluation storing them in local variables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * Updated the data type of func varaible from u8 to unsigned int.
>  * Collected the tag.

Thanks, will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

