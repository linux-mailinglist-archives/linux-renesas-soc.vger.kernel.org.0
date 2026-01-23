Return-Path: <linux-renesas-soc+bounces-27326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC3aGsx3c2k2wAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:29:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468876426
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E20FE300290D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39D42D5C97;
	Fri, 23 Jan 2026 13:29:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6426D4E5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174981; cv=none; b=VqfbnR5PvjybyL6KoSiqIKR8caky+r3bEXBSqoJfWSynELZ0KvWnuGo8eKDzwqrgBaEbVVbaDKPqOuBr/YOMCnLNLvA1hYFJNabs7q4nHXqmSGaqKkcHhBJHB5jD6ntbXNA3c3iLVtDec9p5NOOEp1ggjprkCxwWXJZ9MUmNXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174981; c=relaxed/simple;
	bh=5NurO0R2/OhT6VhbIKg6bkeoRSQoLzY5e3peAIZO8zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnmkQI5C9zkwknpg/vMKp2tb1RC1/2OpAYxXuqEiHKgQjTX/pM8rWqi+oPUJXRQPFi54MTuVh49p9MnCbqitlwKYgJfwrFMSc872FhG+/MPRGOLTXODkhAOvRxZ4/T0W+I+c3wwKvplp4jhLBxXkxxSS9PS/GMdCGqckBL/KPpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56624fea96fso1940401e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174979; x=1769779779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=hn+SSH7H2MCLGS0HOJQAU13oRKR9EONVFBTh/X9rRwp0Eo2HRFvlk1lhHMcI1vEA8I
         HzDYUV4FGAye02eD9+uJqe82dq3n5RRJc7Y9tGs6tMhGW3Y6EqRH3yn7GeCh32h4vOyR
         I6kOucpDzU0Fc003A7MNvod2Yb24ocVetmOfp2LLe5EXhugoumG8yFZ3O7V1bMtQNsev
         6E1hdyW2TmJzMpBV8ENX7aSxH+9eKaC4xv3YQ79Y9EHgU6sBFXifcmaOzMkJULsHbn57
         kcUskYdouuVokoT1IKKT0U7hqlyCJ93dKtNwAQsI9d46S+5BJ6MNCwXd611iwAMtsVHI
         LeOA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrevSD3D/JCiSdmHMyeNA9oUI5xXAu7fgMD6aWJnWUz69e+fjslVcbD5rh5W2roUCZNuZdbGkv6DQgUJIiuIjrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVrW8MjK5RZSoLwtUEBmPAdSUi6Jfp2ceHoid5j+fsbLi/tX9
	xC/lHf1ItxQNXwQWOTCPmxhVkEUP7oPvTurWkAeHkB2iHVwIkTf00cye/4WKb1XB
X-Gm-Gg: AZuq6aId+Zipr7WRMQ7VylIsB+9WcL0d9Gog37Rrnb9sX+ikXNwzPPl+enDP/U265Xn
	IH1hbXA3x9zSDAcAJp6U2lugv8mXHzoSqwGzjSQUkI6EnBnLA2WoegEdEme2/kt2Pk3p8bAqPfh
	b2iay0gEWcupMGfIustMaNpzg9HCkxSuXADk/D359TgkWhEwLR7IEo0WNHM0CM7Qq6QomyKUkTM
	H3Na12G025AG69fEbIPgfe/ubWFJsjuhDt2wWINrUI4j5f1nzgYGRKjCV1NuKWuAvo+ngUH1aee
	EJ2JVAju1UTruGh7jIpEc3tzxmdkmZfk60IjemjtxU87M6oiICUSOplbHYCmHVWH/1mSsZtKwSf
	D5ulX+xrKhjEV9en17Y/FoytHVDlywfbkL582HL9o0OFHY9UGBv0njYhsORGHqcBbRqAijAb/+w
	csX/f879+IwWlKmS2SDEjMoK4fDVhVSE5J8eqMqlNyFvJNNH79
X-Received: by 2002:a05:6102:5092:b0:5ef:afd9:da31 with SMTP id ada2fe7eead31-5f532daa030mr2263149137.4.1769174979303;
        Fri, 23 Jan 2026 05:29:39 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2ab629sm494662241.1.2026.01.23.05.29.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:29:38 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso1473136241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2rijjw4LzUp296vRv8YmLPuG41sqp19eMmPc/DHPiZhu9+iB6ilJXm1qtHaDs5i6mHmrCcrIHdeptbHznnplqoQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3752:b0:5ef:a3c1:86e1 with SMTP id
 ada2fe7eead31-5f532e93002mr1974929137.11.1769174978693; Fri, 23 Jan 2026
 05:29:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:29:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9XAn1RfkFpof0yUeYhfmQOnZMSNBAA1rQFBNX_Z3TMQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi8xIqx9SrRtjX9A1sHdg0UhI1C_69Cyb2P2OJhm9AIJr1Yv60yV3PReM0
Message-ID: <CAMuHMdW9XAn1RfkFpof0yUeYhfmQOnZMSNBAA1rQFBNX_Z3TMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] arm64: dts: renesas: r8a77960: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27326-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,mailbox.org:email,linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 7468876426
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

