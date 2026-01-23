Return-Path: <linux-renesas-soc+bounces-27328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hk/DkJ4c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:31:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A575E7645B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D82301F30F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801852D5C97;
	Fri, 23 Jan 2026 13:31:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEC296BA4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175103; cv=none; b=WgBO4L3v+HZzfc5DvYVDIEVln+rbD5PIybED0lMPLdNNhwi9tc3GDUmT/28O/JIgWADU5cKQkiGXsiESIaYww5EuXXH/SCcoFI8PLuZTpqant2fsHXOoEw/l8gU5LSEpUqTlYVLFo5YnLYiXCmJ9FImS5gjYiGNdzHHrN0GljoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175103; c=relaxed/simple;
	bh=5NurO0R2/OhT6VhbIKg6bkeoRSQoLzY5e3peAIZO8zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLVrKrJ7u8uvOX4ZoPUmiQECZchPfgLsOk41WJ/B8yOPxtapYj4ZorEi1KzHfDeSkH1Z13vi1s9hssrqKxB6+wjQPMGFjYo6jyyMs0ZnC2gJUEZgnJXb6/fFjOuvyjwV1uuK62pQ36iEhQQlJNGbQIM7bIPmeWxVaawXCeJCXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9480c6f8b43so594155241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175101; x=1769779901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=opzaCv45uvmx2020gIVE2uwJGH6C+zV/c03ry+uUdW+Np1CqtImC7YYV7l6DIrJykK
         q1N/PRkDVkEohF25+sxzNybs2JUhIdCMouQasiMGjipMgAqVn8+AUJD/kivJORnilkZN
         qnfzC6s2YxEusmlQtENv30m9lGi0SzdL4utuKW4hJ+EGSTTMCb6ruHJ1LBEclSbt1zEM
         KfH+XFtw+K3ElYyq/+k4ZIYQCTwr1m7UpwfxDGNwHdGwLP8RFGqMBQzv5dljwp0L6kbe
         pyefqNngQZbiRyczxzDsy2fw1oCsrUKUn/sCRVqq9DM4KcCdowAcfXr6uofRnTUg8ROZ
         wW0g==
X-Forwarded-Encrypted: i=1; AJvYcCW87ootnE6jHTa/2PME6lqR1Yrv3arlvtxWre7ckG3nBXGk1L/HmOEsDqPaZW2txWN0rvJPz6CpY5vIuky3gEMg4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Snv7gHcbZ7uX9OGYR632YWvQasv/Fik87B8+Y9W/V0qHyaDm
	qetpWRJe07tt02DBf6of8rjGanLG62Ix8zfFeiR6RFQ3e/3Ctsp3q+AswfCAySGC
X-Gm-Gg: AZuq6aJHTIr4TlFthvRy3HRnZhuh0BAhLklEf1C8QPMHn4jU4bV4KnvzUG+SuKxHc03
	LBpyv8Rgh2FmxoQJ23MRc888l+59BzX0Qf8XU+fE1boIo6o0u2Dql93L4FAwtVblLsM8ak1BBZG
	C4GXfqyrHk3Q4IXOwRI0SOTTwLQDlcoNJjyvKPw1PtR2wvhl2gJIswEheWs9Y1pkLca4jcXTeud
	KWHioA1TS8prg6j4yNDFFgCFBIuzZPdPGGZ/tPtKwwMs40/7KqMto9s60ss+Smo3Pqn2RUFPV7J
	oWj7nj/+76Y31nzMK885L8Ovy7U0Nscex5pkkZAiCQInrRZeblGHF0lQrQyXAGg4tTMnVAtUsU5
	22fOIyL9lzEQ1+xjcM7W1JcBlhX+KSWqwEkTcBOb6et1xgyGf7RQxKYddRlP5yK8SpihpBQUUP3
	hGjyBmYyfL13fDb4m8319fpRg9gKgZgTQzH59h2VKT8zbOBKkIV0z7gynVRDk=
X-Received: by 2002:a05:6102:d93:b0:5ef:b3fa:c89a with SMTP id ada2fe7eead31-5f5586d31eemr299727137.32.1769175100936;
        Fri, 23 Jan 2026 05:31:40 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d66fc9fsm506639137.14.2026.01.23.05.31.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:29 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9480c6f8b43so594095241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOJywgbXo6JxtOh6U5gTXuCIsUwmg07kN2pWBRvvjSxypNs7TdJPVFzgRtB6CQTRT0OTZtCAPyT+9f2KWyihV1+A==@vger.kernel.org
X-Received: by 2002:a05:6102:41a9:b0:5e5:5ed7:60b6 with SMTP id
 ada2fe7eead31-5f5587483e4mr261455137.39.1769175088847; Fri, 23 Jan 2026
 05:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:31:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZoJX6P9VEMoFRaPfwQUEtr65f0dE4djfP-SGp3MGEfA@mail.gmail.com>
X-Gm-Features: AZwV_QgVgI8LRuqulRD9turw-2cvtSAPBn2muYug1d2m7BRf781VDBF4OGiC5Ms
Message-ID: <CAMuHMdWZoJX6P9VEMoFRaPfwQUEtr65f0dE4djfP-SGp3MGEfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: renesas: r8a77965: Describe PCIe root ports
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27328-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,mailbox.org:email]
X-Rspamd-Queue-Id: A575E7645B
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

