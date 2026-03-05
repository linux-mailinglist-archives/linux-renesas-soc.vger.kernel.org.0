Return-Path: <linux-renesas-soc+bounces-28865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB3CDI9XqWkh5wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:14:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE720F841
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 11:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A5703087B1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC53374191;
	Thu,  5 Mar 2026 10:04:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47737C0F0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705046; cv=none; b=JS4Yojf/QgzgcvTzWGwZF21bD50NdhQLKCPDB5CSlEN5HFNx297F/z+hZJ3LEaDR73/VXvr5xxvn80q2VhgVMpGKX1D0Z2ZkVFnk5DwGD3pXYgYhUFtrboSj/YoAtWFx9Es1ZvJwtZhqbXZhP+5izEHvQTRtMDtbrLJq1UQpMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705046; c=relaxed/simple;
	bh=508+zCdHt9MWfUxEq50brZahkkEiVxDT5BqlILcd3+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljZsdiI9t7GLpJVBodipwhEc4D33l2OUeED/rYD60ITdSdPMYIW9uzVr0fQZPjdF6MX0Q80Etm7Z5BkJBn0b1coFH+7h+WXgUZ4vPt2STcwsYadmuHf9XELw1fSycSMLav52duh6dwn9ZJfKUlGbOi2iInub38wnlYcnhvzVCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae56f8776dso28316685ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705045; x=1773309845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=dEaAB/O1Gu//a7J5SDZhUTF90H32Yq3YtbC++wj2/TUEg48aqy9Sip9EKeKnLtK2vK
         tAy+pBIiLUg2+NBmjUqph1dsEc8Od7TQ/haHe/ZFBlX7MfpNT8O157GhXkU8P+qBJKS9
         49qA+XAoVDerPlgOK+dtXY4kqxOFPimrgVFzH/EEvfTRCfxmgeS3GsAT46aFVAY5hmMv
         hIcaYJziR08wU+k3gI+lVb7vGCCNXbZqeEuVLM/ZWpoTuqEDPi+Q0sr3FKwyqxp05yG7
         I9tHfh6iVJ/mDF/lCJ7txx/m+IX+uaBSG1PGEE74lhJglNRvzaWiUROTN8k59xfAhul4
         5wdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFB9cadV6zr4FvqfHFZ80S5FtjB9QFYjbR6ZrTTRRRRPahNXN53NFPchGSY4mluhMGcXezxhNbbrc80oN70dftLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyejG0fJGZ8g+gR7E7eW4hMIA+aPPtFlbD98WevG1On3Jm6Owar
	dKnEXosi3qP2MnaDJkuFRAYCWTlBJ+MolnSrXQa6nTCelUYVeBFsxxN2HWRRxzGp
X-Gm-Gg: ATEYQzyRoI59HeDFBE0/fahaw/tZRvc5E20FwV7ZZJqWfaiDVygyJGUYEsCVOzTn6Cj
	8nybH1fWvu5ykHDgIxzPrqQbHbb8CxB/Sel3PxgwYruVTmF0FOUh81LaZpBm57Bn5ur+X3299D/
	Qu4i7i4q23hzT5mNSXCGkLcw4OTaoMX0WlU8czGaHx3VmjsUn1CmJQ0wYlJVPaBqiBUJ9x8ryfV
	Mxz/tekMOzKfvo3J2/6c4Ao3on9kYJUHfBmpQtaa7KhnRlWqEpl3a9QGUIKcgfFg2gQ3atqz/BU
	Qvg+GlNJh4xhc+vf10gonuEyehaY+vJKe2SCsTgh3VhWx/0h9pqJnTpCewHGYIrBLbFyOisD0zR
	lyyWbXJA1cs1t77d15/vI5m1SB8+JvwAuYDHMHS3xyhoZxZNilI9eptYH1jYl3itfWLqcC24ngH
	S+Y6txMlivY82sTIZD49CFIhKpQ2RkyFrivRpA9xuOe3Q1meMAEKBEkiKTj5Q=
X-Received: by 2002:a17:903:283:b0:2ae:606b:bd98 with SMTP id d9443c01a7336-2ae6aab2a33mr52012195ad.26.1772705045244;
        Thu, 05 Mar 2026 02:04:05 -0800 (PST)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com. [74.125.82.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae541358bcsm102963325ad.72.2026.03.05.02.04.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:04:05 -0800 (PST)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12732e6a123so2541984c88.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:04:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWa0+gWYV9cDnuueWCVmq24sdr387DVZ+6wUYa9j3uhsEvi35BnL2DWCDYkQjBh18L3vVz2ctLZVA0jgviwRGun0g==@vger.kernel.org
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 32EE720F841
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,nvidia.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28865-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

