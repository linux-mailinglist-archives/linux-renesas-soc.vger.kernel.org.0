Return-Path: <linux-renesas-soc+bounces-27327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNhsOx94c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:31:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917F7644B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 623B030156C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38010280037;
	Fri, 23 Jan 2026 13:31:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AF286A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175069; cv=none; b=IVSvr9Ekq5Day62p7hzTRHADas3yF5SQOn2+icZJei3xuB2VZJgreE5CEu+0gioGK8uDL1bNBEa+PzpzFc6xJRf3ojhA7Canl7r+RrwtwXFdIdn3fhikg2ni/7DfN09tHpX4GEBQfEXKSI/ZX6H8gK94Cz/myQE1fKKs3hTbQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175069; c=relaxed/simple;
	bh=5NurO0R2/OhT6VhbIKg6bkeoRSQoLzY5e3peAIZO8zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WS08SYBtHgIGVVPxk4gHSraJmDVt14kjjvODYE5qoKdWWRuTOPg89uaXGw+p6KQ7jtC2f9Hjp/C4baoH7+ba0SzpF38CwuBbPl9hYV5G6ReCZL9tQ4AwEFlwJ8gjy03lQGfZ8OvXivmY91I0+tJoiqRsn4e7uthUtJRlj58mTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ecddf73062so1513418137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175066; x=1769779866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=HTlluZFHZ0QVoT4iNTATFxVbnFgAwvMR3EcTE13rPox+kTgDsg/qMoEzqN3tiqYqW8
         fLI1ZPYbY36IFmX4dh1cEAqDprjvYEb74eo3RSv2LoYeNE6ajHCgR1EL1k8c/q6Eugkp
         zJlo7FxCLfKk3BM3Jc151qLuwU+MlWXHG6mPVKqfgVlx/qGuKyrsC9cr9+xwyFQsaahI
         URxbYF9QCkU5nNZ5yc3TeW0dTON6ItXp60seqN69Az3GOE/aYKHcYQs774JoIJv5XjHQ
         CTNUCVVGSyrMMO8dZulWPA2S0paeeGkbsIS4NRbfkecBAYqOWObiUfTt2uO1aH+FwQiA
         lChA==
X-Forwarded-Encrypted: i=1; AJvYcCUutKykEk4KHCpleCG3XngIIVS1FIhaYnpemc3cz77y1sEY1ie7hpBiyLV4jvd4BlaH8dQKu0aV2ZyrNHIZqJBmPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSs+xjTi8ZclqVWKwwlMvS9tKIFP7ecbfgkWhNWitgEboD/AA
	Ti9weEAEIz8ud16UNDh0MZPL83X/Q6anBxGJsrLswA22YHB9yBuQKL3C8XSZJpu0
X-Gm-Gg: AZuq6aII22Qxme4iKxN+k24aa6VuF9FJbBnPSXyyN57VIlF/IfgAkbHEHfpiT9JpB9Z
	aesRoO18JHx+IUW6Nk1hz/Kt+ABqBSIwb1fVLZhz3IW+ayqKBoJJIBIqaOM4ONp1k62Ft8vE7U2
	28r2z+WTqoKRMXqYKwbFw3ZCieXTGrooWglyA8V680S2FKZ+Djk5SfkqpErLeKJG7mMxcQ4rM4a
	/d2M0gUYXJVr2LEeAj28Z5OU7D49xW/3KNg97jSzTIia3YCWZUXIPbNsPWaeAPzM3JTohYw52sd
	HYYnJfgL2o6kg2QiLuaVyltvy4JLpG73LFKp1im3RK7j+FAVqy30cszhm6LWiDIonfmIAV5eN87
	3MyZKjDHLCTPETzJw4CTyz6zTcGg84G/GQEOeV98GqX3BB8oGtx79MyL3WqRi+nxVm5T7NPnEN9
	ELf4WnmTb/hj37f4JfxGrUFDO27B2chTFfaVmw1rMIoaOm+kEcHhjV
X-Received: by 2002:a05:6102:50aa:b0:5d6:a6c:2458 with SMTP id ada2fe7eead31-5f54ca3b07amr776576137.9.1769175066546;
        Fri, 23 Jan 2026 05:31:06 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d3d849dsm500166137.2.2026.01.23.05.31.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:05 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5662c2937fdso2086790e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSBtCl75umND3IB0EjLv8CX3pNj1aaypFo0sNFe5aZ5HMgQW4gMJD+408TRDjAcOcRZXT4zycnxETjsOxDVfVHxg==@vger.kernel.org
X-Received: by 2002:a05:6122:6414:b0:563:5bd7:3793 with SMTP id
 71dfb90a1353d-5662cc268e0mr1610597e0c.3.1769175065114; Fri, 23 Jan 2026
 05:31:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:30:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7dKG5SQt0FKc5PCpa6Ew79e5Xm=GQw3KYvY+9OKLx2w@mail.gmail.com>
X-Gm-Features: AZwV_QgegGXBPtMl9ShTKxG3gBg_w4ZVsxp7J0NjCRso-dcFlW5sDr7DiMpG720
Message-ID: <CAMuHMdX7dKG5SQt0FKc5PCpa6Ew79e5Xm=GQw3KYvY+9OKLx2w@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: renesas: r8a77961: Describe PCIe root ports
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27327-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,mailbox.org:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6917F7644B
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

