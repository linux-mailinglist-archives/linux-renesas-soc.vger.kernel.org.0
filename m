Return-Path: <linux-renesas-soc+bounces-32994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKppOOBeEGobWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:49:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D475B57A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60AED30E195E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E614C3B2FF5;
	Fri, 22 May 2026 13:20:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529003B19D9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456052; cv=none; b=idHdD6CGyJH6EVuyzhLUze0x3vvx+Pc+vRy6WJx58fQ8GJn/apqPVgS5EzZNmoQmoxPmyblCm6UFWtfZeMMJ1RDNMuXkpccTUk3lDtUdKAZl6ExolYZ95mAAy7XklzuilV53crvfElvXLy2Z5FlUdZEdag91GCwWfVvwEHtIEkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456052; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jE4iCmF1euGT39J+uTV6ySlw8AlwEROpZMnQCQcRWFIenyDHtnf5a976ATnempDxDz9KTt+OvpA30q6b6ZVmpIKgDWz6gCQxiUs97MuKCfUsfKjR7nehSJsDNMPSx2CSa4SB98cOQR4fP+Tl7Th6OwVu3l85UTrJ/dsZuOUEbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso15145659a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456050; x=1780060850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=jTSbgcEoyUFdzorOmKKtq3b7GBwmX5z1c9kCh08F3ZB4xkwPW9CA93B62H7TLGX0oS
         KOsTGqu4mpfsbZUPXCtR+nKdFGK/ogGRXx1QIwFZXdRG0fIl+WYiM53OQEQxUJ4SgzyG
         zwQf4otwAgsVots+FJG7/pBlSAUxKEfjViJyFH3SCkBhz2wz2vBRT/PaRTEwYstNNHA9
         Z3DjqEJXGI+04tOpZRUGmqKao7dPlDuA2eQWUVc0+a4jHV3k8YgttIhk8l5WaeNIIlAM
         38BaB3RCdhKwRjkUJKv7EeKYbnHgewl8+N3z3BXe9ub0lckNZJDjl/hg73MzxCdJg7hi
         Z/zA==
X-Forwarded-Encrypted: i=1; AFNElJ+XdLPjx5XfruJJc0RZnjQsmLpHgNas6YhdnjIA3oly7DdkQuVbAOV5+AQ7jlxJB2LN0ytdfCEJF0sIPwuQLpOh7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSEtO5Ks9hUpUcCs1a7CR6pJBjGf3SB70esZrColr5mWoBggV
	gpbhYEtRgccN2Ciiv9t/+Vy321yjaZ3+gF3zGYHup+VnjZ1ZDriUBxrOp9h90L99Dj4=
X-Gm-Gg: Acq92OH+sVXG6fabDnCPriNl/f31nhjeYNqIUUdAjWqyz9ZQGu4WJf8Fny/SHoXpwNa
	wC/p2KSCluGgRditJmaczvONGoFcJI1elFetKu8Ysa5wRBd++3Cp1v6ufY5kKzgBXE8pf1luFoz
	aY/WPEKOv92wAy9VLxZWO2UvOQ3dSFBQV60RqkEqYTJjfI/1au1yNaa73xJGxqAgSGRdE7BTrK1
	7/6zEMqFgiZObyAumV82U9m/92EaLOXtEB0Ha//EWWqGad4sYCCTvY/JhrLK34IrEf7Vi130Qsa
	Mfnt0FlVVDd6zCKvnHbY6C1TFsYFKgBXGNIhDC8acIRrYGulCT2D23/FCMX3UCsaNoUUqOxXa2g
	3XyXEdwSN4tjLqa28i6pRz8cMhfM+rc7yc3tTk1uhg610TP12jVvhgnURvDAgxi5+nYJ3sCn8x4
	oa/UBLDASQgFhfEpVFGEZ89jjXxzN39BJFJAYBOpm6pJr0Lwz+kqQoWA76S7WA
X-Received: by 2002:a05:6402:42cc:b0:683:75ec:c17c with SMTP id 4fb4d7f45d1cf-6889c4464afmr2038574a12.10.1779456049640;
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm677242a12.5.2026.05.22.06.20.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso11739075a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:20:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+38s5qNpQjfZSdNOMJWk3rhuiCdQGnd/nl4vyXsFZFaWW5eIiNCv7n6eDISIiWk47cR/7l8DLhZZd/cSc2jYFBGQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2111:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-6889c437481mr1999990a12.1.1779456047876; Fri, 22 May 2026
 06:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:20:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
X-Gm-Features: AVHnY4L_KbB8gzS9scFyMNemawa__tn8rl0sAqed-jsnkmOH1xrDTQxnThDhUyo
Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: renesas: ulcb: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32994-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E8D475B57A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

