Return-Path: <linux-renesas-soc+bounces-33024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A/BHt1/EGrdXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 18:10:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 856855B763D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 18:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44228300D54F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEA93D47DB;
	Fri, 22 May 2026 15:35:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90021402431
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464147; cv=none; b=Q/rWKpN0E9wpz5bTnAfZpAIt2YH9TAfhV8N8cgrTHujMGzkWEy+rAooMzmfQROUdiir4djoud7Efug7Jsq3SOSEqjWZnNtHKjkiVPsUfgVl8ufonJJI5QNGN7Vy6ypP29iUwI3zwtDjnYLXV7bsD46+aONXvwxrr2HS48g6C2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464147; c=relaxed/simple;
	bh=EB5tKPXi7NNM86vQZ4/x9OqKlx4YTJ1xqabX+NGrs1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFJjckgvj/U4xDOJBVV8q1nKLIrvzeDPG0yh+VrovPIZDEt+qew0muY2J4gbktc2ALJg+PFAG47wa0w4vvawYNVKNLBUFCDNAYi9kJMB8R4Ygbwv27Hd7kpguzvpf5JNIobqA1pQOE9VlxniEQ13NDmIDjwc+fHUsEDZh6CihY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso8396385a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464145; x=1780068945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdOpo31kserPmrGp3GvpU58TPDoGY+y8EflyrkRt+J4=;
        b=hmt6slc+GXPMbd87lrMDFp00UOl6NWcHzocIJNDJ1KRht22m9XGuqb+VhInEikQ430
         ZOe3/wqhX36oOzLiHQ2+Uk0r4st/MrvOz3ogYZYfQthgrV0t7RZ9xtrjuuZwY7qVb/ob
         kLBW+llGBrnxf1SCYa+P7AwAu8W4UnWj70nfrWqIz/1z4qx1tv9ThUluMayuqd97AmQ/
         XZJpHQhKbGQGghM/0q6nVb1xeTZPi6pBHNROwbzcaKRHmvV8r+bq60ddjr74KPuXKeh0
         DkPsJVC3HIfaMpFgsNJPgmUbItL8V3joz58Wvk2q6Pcg1wTXUi5VW0vdjiF120LO/vjQ
         o3hA==
X-Forwarded-Encrypted: i=1; AFNElJ+MDPchkxvgoUkS2+gaGZHGMdcw2d9b0YA9gQXQHyenCIUpmQXdFVK1Pp1tQqGcYLlrasHpO17oSnS+FhpiG1+SJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJExWLvYQrJH53pYNmu41lsbvlUKeBlqlWK9f2V89EHedPaMP
	g/zXKwKH9fAWnpZ5gkOM72SHLC4Tu1yY1lomUeXocxB6OZxcFDPhpzn9kGNu+upiKqA=
X-Gm-Gg: Acq92OGp130yrjO2WbIEv0sY89gHVyabSKcgf/mh76jtJ60X2+5Z6iecz0QD7145q40
	LJZwAo2ZWWOYfVakfcIa7x4Ijoza5srpHj7C0ZYwZrGjcfbeB2UJU81xhUE6D0xkaN0laISPlKH
	Vq6Ed0XHNdlWapaB920PHoqVHux1NztS2rBuQXfBPV3C7227jtFBJEvYuC0aU/NFRXJqUAy9ktG
	/cgr8uMYhmEBWhcLUUR3oOA1l3PM95nNeNI+t48+v3Ge0RlP+UiIgYvO5ZwCxTRZ1VCCpPX0dO1
	cSPjwp2SMQ7s7oNnA0c27XMbiiWM2RflyMpWDAMUr3VqlRsgG6AEROJchvfOKZUqVpyRR/bNN4E
	VriJlxVO6bLNX/0Sv3DJeVOaixPpuy3VNOMstWN5Bcjf/tZn+Y9qzXM49uwCR5PLAuYouEG3hkL
	bSVSMA8opSLGz4TwINlJ6X7fEQUTVQlM6VqziCXH3Zy9BYNsbAIWHsk51IaGbW
X-Received: by 2002:a4a:e903:0:b0:694:9e2f:cfac with SMTP id 006d021491bc7-69d7fcb51b6mr1599894eaf.9.1779464145474;
        Fri, 22 May 2026 08:35:45 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63976d57sm2084745fac.9.2026.05.22.08.35.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:35:45 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso8396378a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8cJo8X2r2QVYyEQsiW3f+zanpigpZoPsBKT1R2KYj6X7Rz0im1GcRh4mmwT83RKMcUxdE08kAIrgCVrf03g7wg4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:634:10bd:95c6 with SMTP id
 ada2fe7eead31-673d1c38b59mr4123345137.22.1779463759525; Fri, 22 May 2026
 08:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
X-Gm-Features: AVHnY4LJMj7MpfiKYvQ9U6raZAqssKkW2xRRdr52QyR92yVonmyMfE85fwhFPPk
Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33024-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.947];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 856855B763D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

