Return-Path: <linux-renesas-soc+bounces-35037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3NTuMS/ZUGrm6AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:36:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E12A73A4B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75C91301F156
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B25E41F7F5;
	Fri, 10 Jul 2026 11:36:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06941DEE4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:35:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683364; cv=none; b=hh2qit8xZa2XAfyOVLZVRaIjj8xUrSdCkt/9k7+NIoZcAFeN8NuPsmDAZD5viewsOt0L5x0R1fl1/4LSt/ekONeaQWAeF9txpbnMgYEQReDgREum8f/WH9BlzCc6TUJFVgHP/teS8Ji+kjy+Im4uRNiwZ+2we79eoTsKUPItaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683364; c=relaxed/simple;
	bh=4pksEl7hMLsBYG9ZkoLxK/BecZCy0PswewcYkqaTKsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1uT9AtaqlE6fxeUTBfgfB0XOAR+4oAydp4345kprmxU+3+PKmib2fJTsMvIYnJeIArFtTno0agce+tyjjNCTexIghhmv9UpMJbhtq82R+VflQmAEAuJdu/EIE+3fJQe0QDP2HX4c1VVlWsp/osOodQn69afTT/t4TxhYMHTclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso1001148241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683341; x=1784288141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJD6tiSjIPreQ8N2oNzf0qaDxzfObFILUs5bMv8F2lc=;
        b=XvMWTdLm/jELr5zNBCwIrwZjsts190tPkahuOxKI6vCBK2bHFn4cMAXkBBLfjD9deQ
         1PbBh/m4AXlzAhYJXwGSoMpAtNt5IFCSH3wO5cQ2BkLELw5zY/pwaTowaXXdl1LOW2mF
         KgzlZquxUjutBpJ5G6feo7tC8Vd0DcV+WmZ513MC+eU+4jmdbqY9Dtrcsdi/ckIAY/i5
         lnr8h5oeE/QXMWf79plLn0SHDr/brqgJrxbesUWXmVcWIvfv6H3iOhrLj8TYB2rnp7/n
         fyqrmzxt5hq1luIlj05BQcTLwjZpTzYAKfye2x+8DJlPUcNWPYSaxAz3T5/GLqFimkfE
         mECg==
X-Forwarded-Encrypted: i=1; AHgh+RrOo3tiON3Pl//k2upAys9CJ/QdyKc6mv62ziOWEkVkd1DfyVjlLx9vSZigKtPVKvZS78ppnibPd4S8Rjc5UW2DeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbi+Ts6ueXu9vwLBwUH/hor5UZAUXMdglmd6Hs6gA2/L1yeE/w
	aPijvPFGCDI9ExMeeTSsqF77Nhl957JwMUD+eWfnoAuB2ypLp9HJ+sVZ6ahfjbaCgrk=
X-Gm-Gg: AfdE7ckx8WG1snzmtFizhis5rkpwW8BtuETqAtUtEqrHV6V+ynxgALZV1RmXhkdozxm
	MiZ2JLh69abreYcVN4v6g25fcraIqaeqaVu3fJJjqfMzmk6vrZXfTyPJqVlE/bH290jTxQXnRPS
	Cg31MatMkAfcqOSGEVX+9eu1BZxWPukA2a7KIiL2ANIUZkc2HvucplgAAyO2ZqaCQ156eSvqzBn
	orDTlLElkaORG8HpRY/uWCIWzMSeLy/6YXDpJkNgrQj7jC39v3uo8iAyo/8sMIQvUzgf/BZreAR
	3UGQlDsd3TZgLcTQV+08QxrH5pZCSqFpOm8YsOxXOjiKbWZfZc6cSTND5lfGfSWr20mITo1kDuJ
	xvN126OObInyUB0wHNpemFx+8ORv/UItQYSAw0i2PVtTP26KFkueWAs8LmnRLpf12NAqA8CuXFn
	yD4psm2dGkZgRW2m0d77+7oURm77A4Ihr/mV5YDqa4ObdqqKHbKg==
X-Received: by 2002:a05:6102:5a86:b0:631:4385:15cc with SMTP id ada2fe7eead31-7450d017b12mr1756126137.1.1783683340683;
        Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38d35sm5104403137.12.2026.07.10.04.35.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-971de219a85so354495241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqUommZKju/glPv15Hdbp4VPyIc+VdCB7oZ33jQcksJmZhQ3sPhoxKQhUKR7D5GENn7ncRykU1ikrqhp6g4hHwtFQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id
 ada2fe7eead31-7450c6bee37mr1282524137.1.1783683340215; Fri, 10 Jul 2026
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:35:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
X-Gm-Features: AUfX_mx1HkmTEWvYMocI1aNW_zjBk9JHXgCAqkMrY6has8ck0rJ6O0h4yvq4kRE
Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-35037-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,bp.renesas.com,renesas.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E12A73A4B9

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
> RZ/G3S device. Document the RZ/G3L USBHS IP block.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

