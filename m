Return-Path: <linux-renesas-soc+bounces-31395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON6fEmoD5mmBqQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:43:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B65429719
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDFEF301371D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6594839B96A;
	Mon, 20 Apr 2026 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpYPIpNB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043639A06E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681820; cv=none; b=AWQDTg2UTnvLo7m4eZm97HBN8s2HzwnO5ygc5NMVFc6EfmZESqUg3x21j0ksdnxEy8zeh58neoeMxcihHuZt89TYbHU0TDX6fpF06kXlGSsacd5bZmkEfXXsUcFR7Upz/l7DlMwXesBFe5HowBITf06Mp8xOZGztWMZgYeoEnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681820; c=relaxed/simple;
	bh=6K3LBwKZtl/O5qux1dZKU/P19V+qTupizNtd2usjTr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ViS0jzhYVGM+1bd9Fy6u6623O71GeueyapyHt32iFYGc/SxyRKBMbntDv1dCJOMBGzf7yvoHFhxvBjjVVWDbffjMqh5jWhBVa049czTgHr9nLwMJ1/2vtCqoEV/dOsCK4BfPBBI7YgHug50kNe8QI3peGQ5Wff609K4kIQXGtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpYPIpNB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1879080f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681816; x=1777286616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+YOFEVCA4Qb/vVfgbvY+5B7C1GS5CQEkyZ79MqsT48=;
        b=dpYPIpNBtVaMRlo374KMURJjoFUHHwvAvNPVqm5Z+ONcSFjKojQ9ZcI6KP1Ky5y9ta
         PjRN6rfPbOubK8YLfSPfO59XsTtMmSkC0cL9QFXQEs4kYOnF97hs3gUVDNYhm6PciAsQ
         PsUn6lxgucsKoeTgk4ozWmg/7hBNlKi47MH71pZ5Ak01c1w5ZjdpycG3KwUCYp3oLKr1
         ohXK8zwoHI100ilYA+oT5xFz+a1MBzxjXGKc+qSJd/gDH925ozHBu91/so2cZccUksh8
         LCQS6pVaOq8pmaRLSS9pu0gxLh9xYZUs58ML7iGVc4KX/9sNV7b9iBzBsI73uZLJEhKy
         32kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681816; x=1777286616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+YOFEVCA4Qb/vVfgbvY+5B7C1GS5CQEkyZ79MqsT48=;
        b=Qic+pWDu4PZx7UnvsHuDEXyGiiHSA7WFcweG1zezunLFWwCHWofRHvScK6Q8mQrqMR
         l2Ta9r7pFdm13HCBV1loKsHHQZTMhmndrDzO0RUKuqskV1w5kxUD80xo9jUh4TnNGetY
         sbKO1qQX9esVUrD9W3noGOkcd0jIGVEzS9haE9bsEZ/wu83WMFN/53uSAmlkhIvW0wuC
         MG4tsaEzQc4AhIbsan6JX6TjvdIbR7gq0vV6B5b8Iws3JOK6ODa27DTBrX7OCENdMU/w
         lYtnC8DKo0mnFCmgF4kO02x16rosYgADwobBLJUNzrfXh3bjagc4FjYoSYsqWgBkbngn
         Weyw==
X-Forwarded-Encrypted: i=1; AFNElJ/HFiTbwsIOrqzWnawZeUCV6vsxLeQoaFcrQ3aQVDyo4Bm0vLVSJQYDagHwnwkB34hCXPyh6oxlJfBYcYGkUMHziQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGrWmiaSz0e82lTCqeaZaeF1lBpyWbANfgmZ3qfzkmCX5t6Q8
	6YWRJXKQewOzY2RZuO+Zq2gtYYho12WqdjAE0LaKD1Dz5cE0MtRV4mfm
X-Gm-Gg: AeBDietyLbuGuvgOEmN1jO2rW99pmS15FdLaRUuxCb5Lb70i8hmJN2KYn0sj0M6Kx2t
	yhQ/DwUgqQIgtpgrJqu1fzVbZ2qqvfH/Pby2U6gXjtmlbw0iL7t5llsRS7+PzMnWXSz2f8FvGd2
	6kWFl+sETtoYxIZgzKSKCxo1ckF43+0kNzN6IUgRK2tyhq5NLFUnkJnuTReKuw7K4wSnLR+mr1n
	DgRUDtNgrXkKldgH0ItFCF/E0amQZcQm9kD0NND96wmZnfuPsvWWkiP3WTQrU87hDydAGGTkw+X
	G+MmGMVWJThAeJWVu00/VRlb/TGNYQoTCHixeDk1EXGF81xsWPl/J6LxKZeHvX4cr7muYdFqujI
	uV3Fw5rbN0B783mxF/8ubocYlGyUDYznq2zFYF3xDV67hFhtF5BrKRGxhRnY9Agj1jaeiNOGW2Q
	7HOvydGT9ne1zcgZk2/C+ALU+0mAPF5qtzL1WfkhsBdIDT4GVDpyE2/NAcAFY=
X-Received: by 2002:a5d:5f92:0:b0:43d:71f4:7ed5 with SMTP id ffacd0b85a97d-43fe3dc54famr20093995f8f.17.1776681815619;
        Mon, 20 Apr 2026 03:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 0/9] Add Renesas RZ/G3E GPT support
Date: Mon, 20 Apr 2026 11:43:17 +0100
Message-ID: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31395-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 57B65429719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This series extends the RZ/G2L GPT PWM driver with RZ/G3E SoC support.

The RZ/G3E GPT has a number of hardware differences compared to RZ/G2L:
it exposes 16 channels (across two GPT instances of 8 channels each),
uses a 4-bit GTCR prescaler field (versus 3-bit on RZ/G2L), and has a
discontinuous prescale sequence with powers-of-2 scaling rather than the
continuous powers-of-4 sequence on RZ/G2L. It also has additional clocks
and resets (bus clock and rst_s).

To accommodate these differences cleanly the series proceeds as follows:

Patches 1-2 add DT binding documentation for the renesas,poegs property
(allowing GPT channels to be linked with POEG for output-disable) and
implement the corresponding driver support. This configures GTINTAD to
route output-disable requests to the correct POEG group and sets GTIOR
to tri-state both output pins on an output-disable event.

Patch 3 is a small cleanup removing an unused parameter from
rzg2l_gpt_calculate_prescale().

Patch 4 migrates the driver from the legacy .get_state/.apply ops to
the new waveform callback interface, introducing struct
rzg2l_gpt_waveform to hold the hardware configuration (gtpr, gtccr,
prescale) for a single channel.

Patches 5-7 introduce struct rzg2l_gpt_info to capture SoC-specific
hardware differences, adding fields for the GTCR prescaler mask
(gtcr_tpcs), the prescaler multiplier (prescale_mult), and a
calculate_prescale() function pointer. This cleanly abstracts the
per-SoC prescaler logic needed for RZ/G3E.

Patch 8 adds DT binding documentation for the RZ/G3E GPT
(renesas,r9a09g047-gpt), covering its 16-channel layout, 64 interrupts,
dual clocks and dual resets.

Patch 9 adds the RZ/G3E driver support itself, wiring up the new
rzg3e_data match entry with its own prescale calculation, prescaler
field mask, and prescale multiplier.

v4->v5:
 * Merged GPT linking POEG patch series here.
 * Dropped suspend/resume patch; will be added later.
 * Updated commit description for patches #2, #4, #5, and #6.
 * Replaced return type of rzg2l_gpt_poeg_init() from void to int and
   probe() check this return value.
 * Added more error checks in rzg2l_gpt_poeg_init().
 * Added a patch to drop the unused rzg2l_gpt_chip parameter from
   rzg2l_gpt_calculate_prescale().
 * Updated rzg2l_gpt_round_waveform_tohw() to initialize gtccr when the
   period of the second channel is smaller.
 * Replaced period_ticks with RZG2L_MAX_TICKS for the duty_ticks maximum
   value check in rzg2l_gpt_round_waveform_tohw().
v3->v4:
 * Added wave form callback conversion back to this patch series.
 * Updated rzg2l_gpt_is_ch_enabled() fit into 80-character limit for
   consistency with other functions.
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description for patch#3
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
 * Updated commit header and description for patch#4
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
 * Added error checks on suspend() and device set to operational state
   on failure().
 * Added Rb tag from Geert for SoC dtsi.
 * Added SW_GPIO9_CAN1_STB check to gpt0 node.
v2->v3:
 * Added Rb tag from Rob for bindings patch
 * Dropped wave form callback conversion from this patch series as
   it is covered in another series[1]
 * Added suspend/resume support.
v1->v2:
 * Created separate document for RZ/G3E GPT.
 * Updated commit header and description for binding patch.
 * Added waveform callback conversion to this series.
 * Collected tag.
 * Added link to hardware manual
 * Updated limitation section in driver patch.

Biju Das (9):
  dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
  pwm: rzg2l-gpt: Add support for gpt linking with poeg
  pwm: rzg2l-gpt: Drop unused rzg2l_gpt_chip parameter from
    rzg2l_gpt_calculate_prescale()
  pwm: rzg2l-gpt: Convert to waveform callbacks
  pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
  pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
  pwm: rzg2l-gpt: Add calculate_prescale() callback to struct
    rzg2l_gpt_info
  dt-bindings: pwm: Document RZ/G3E GPT support
  pwm: rzg2l-gpt: Add RZ/G3E support

 .../bindings/pwm/renesas,rzg2l-gpt.yaml       |  23 ++
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 ++++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 360 ++++++++++++++----
 3 files changed, 626 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml

-- 
2.43.0


