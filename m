Return-Path: <linux-renesas-soc+bounces-33567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xy5iFrNNIWqKCwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:04:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36A63EC8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HZwqTK2w;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAFC0309EDC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20F33C768A;
	Thu,  4 Jun 2026 09:56:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E838398F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567014; cv=none; b=hXEv2ue6ej3Mn3yqrRJvgLfO39pRV2vq3EOCfkHvgxhT0NT44J+9WEZ3OWZm5jSooDAmq6EfF3sOHdyC1Ot4vSmbkYU5NZ5MEpBXAIlkUzTGnaOHOvk662zq+xE01gpwsZyvBHjpRKjZQLDDtCoz7gz2dOVFS8DI34LVV6yJBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567014; c=relaxed/simple;
	bh=S5X04OlM8U/d1OghNt6LGWawMPoFYhnTE144LY0HR78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2gTWe/1DeXOLyXCgbLXvUQmvU8+mVbB07FsRpWZ4J6+PgdyclR4lg6/juI00Gb5dCquAyNQvYOC4fDW28bsmRX5VtO4hlAeNy7kRIaH2dWlhNbajnbGxpRC65lQMwbFCjWGXxiQRiS60PB7CDUd5L7igrgdI7I6a8MTR8T02ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZwqTK2w; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso6250825e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567011; x=1781171811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqWGrFvBW1qnB8VQMYujgvpQqp10gPwxWFXNFPBUrrQ=;
        b=HZwqTK2wxySSBTSyJF3/hk/tCzveJm1j8I+E71X6mevT77vlb/7gZyX7fg2kRKJ+y9
         i6OMrTHSXo+cgqdZZBLl8TCqe8nQ4RQmuxh7GNDV8qpnXrU9tS85S3g9hzwar9Ouz6nf
         QnxEql7iBKSY257fAEQRdL2oGiaQ9aLXRc+6Q3EMuxM3pb5j5ZwbxrFYehPMIsidqh6Y
         16Spr2bvM2Lh0RRA4dq369pUGjAoqpur6Pto1xAnNTELduWld5ioLTYI90Lc6NuX2ntV
         /C8FJ5JfEBU/BpyFj4guF358qXsblOM1B7sLapQOjGvrl1B+gfvXx57wKcAdMJHmf+us
         0SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567011; x=1781171811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqWGrFvBW1qnB8VQMYujgvpQqp10gPwxWFXNFPBUrrQ=;
        b=I5Cft47WWukyzclPZRUrQGyTsKqi42ZEPPR2LCEX1OEcIFImsIoRESUZXY9thlSn6m
         v3Ip9t6ZxiXfjunH3xQzk8MHbCrDKkDpbwgoP5JeFm1FQSCfvQIXp8uJLYRh7Ftxf/BZ
         57ql0Ry+DyV4LQGpeIy7sbUq6QagekR7BkBU7PVn0XJxtJV+ll9v9WRZ63tdRs26Pf3K
         WrXqTU1G8Pn0vZIgSaX86GRqwo8eefJUkH6kHiAAVSXp3Jk8DNYe9xXU7VPjFRQ6KEi1
         oKcIWbOY0/3dgeN6s7jUjZ1lgymJxzdgVUGzhAjsFbh7cdw3GWaxrf7uCRyNsAuQP8TC
         wSBg==
X-Forwarded-Encrypted: i=1; AFNElJ/ImuOuMcv09T1FLnjGoYaCuSkF4iRah8FtQ2yUJJ5oKVxNqe7vppYTIJLkHHUotogpOIfEovMlP0HoRFsauh15LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwytBe1IV6vU+Sgx6B9bsBNAPJvWJ6CZfrcI1dXsoaVL/6J36yR
	hwvoxAP8dpHv1ZWmI2bQlrc/VMtvY1L4kfogrS2XX+JIfg8GsaYIm/bO
X-Gm-Gg: Acq92OHWnqFNg3o/kwJFwUeMdRGaxaE28wj2MTOBhWeZ5vTVrQmNt4s1+6/Z/PmiEZI
	NN0EXj37VGiExRh+0GiP3h9Gwntr/0LsDmpqmjlW92LQnPpg1j18BAv2CqF62SUm1pyq7OtUkM6
	XWoJ58IYI3bQs6KjP2RTn1Wxpi3v+Sx/73xFlzpPV+ugF5n2fEjW911Kiwd71RknxMg3EOfTJ94
	qvOKCfZaIX517DUKEIOTE+jMxWulr4BQJoMpxSHx0pr2RU9e3J+7wy1YHb91TFjH2x8Y22Tp8ky
	H49XOEpk7VP/qetKEdvRg4e/KbMGnTpNidwDCkzwfmp2HefOsy1dO3Xl4oUtRI6PNSFrVMAGwaY
	Ltbc9kB9sOf5kUXj61cJ3q3qDb5WyLYvSr686JFBDRZa/Lc8Z1S6eyjl2WlV1pfItdG5RevD+s3
	r5GoA0CKTcxOQS/SFzQIp3ODbHkusVcV9OQnXLtQ+xynNCkVkb6M5ASD4RCSc=
X-Received: by 2002:a05:600c:4748:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490b5ed6ad0mr117157585e9.13.1780567011084;
        Thu, 04 Jun 2026 02:56:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:50 -0700 (PDT)
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
Subject: [PATCH v6 00/11] Add Renesas RZ/G3E GPT support
Date: Thu,  4 Jun 2026 10:56:30 +0100
Message-ID: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33567-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:biju.das.jz@bp.renesas.com,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,pengutronix.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF36A63EC8E

From: Biju Das <biju.das.jz@bp.renesas.com>

This series extends the RZ/G2L GPT PWM driver with RZ/G3E SoC support.

The RZ/G3E GPT has a number of hardware differences compared to RZ/G2L:
it exposes 16 channels (across two GPT instances of 8 channels each),
uses a 4-bit GTCR prescaler field (versus 3-bit on RZ/G2L), and has a
discontinuous prescale sequence with powers-of-2 scaling rather than the
continuous powers-of-4 sequence on RZ/G2L. It also has additional clocks
and resets (bus clock and rst_s).

To accommodate these differences cleanly the series proceeds as follows:

Patch 1 fixes overflow with period_ticks variable.

Patches 2-3 add DT binding documentation for the renesas,poegs property
(allowing GPT channels to be linked with POEG for output-disable) and
implement the corresponding driver support. This configures GTINTAD to
route output-disable requests to the correct POEG group and sets GTIOR
to tri-state both output pins on an output-disable event.

Patch 4-5 small cleanup adding missing newlines to dev_err_probe()
messages and removing an unused parameter from
rzg2l_gpt_calculate_prescale().

Patch 6 migrates the driver from the legacy .get_state/.apply ops to
the new waveform callback interface, introducing struct
rzg2l_gpt_waveform to hold the hardware configuration (gtpr, gtccr,
prescale) for a single channel.

Patches 7-9 introduce struct rzg2l_gpt_info to capture SoC-specific
hardware differences, adding fields for the GTCR prescaler mask
(gtcr_tpcs), the prescaler multiplier (prescale_mult), and a
calculate_prescale() function pointer. This cleanly abstracts the
per-SoC prescaler logic needed for RZ/G3E.

Patch 10 adds DT binding documentation for the RZ/G3E GPT
(renesas,r9a09g047-gpt), covering its 16-channel layout, 64 interrupts,
dual clocks and dual resets.

Patch 11 adds the RZ/G3E driver support itself, wiring up the new
rzg3e_data match entry with its own prescale calculation, prescaler
field mask, and prescale multiplier.

v5->v6:
 * Added patch for fixing period_ticks overflow.
 * Added patch to add missing newlines to dev_err_probe() messages.
 * Dropped extra space in poegs variable assignment in
   rzg2l_gpt_poeg_init().
 * Updated the comment sections of rzg2l_gpt_poeg_init() with POEG and GPT
   in upper-case and replaced configure->configures.
 * Format specifiers in dev_err() changed from %d to %u in
   rzg2l_gpt_poeg_init().
 * Dropped local variables pv and dc from rzg2l_gpt_round_waveform_tohw().
 * Dropped blank line in rzg2l_gpt_round_waveform_tohw().
 * Moved assignment of rzg2l_gpt->period_ticks[ch] to *_write_waveform().
 * Restored clamping of duty_ticks with period_ticks in
   rzg2l_gpt_round_waveform_tohw().
 * Simplified rzg2l_gpt_write_waveform() using else if statement.
 * Dropped local variable gptr in rzg2l_gpt_write_waveform().
 * Moved mutex after early return in rzg2l_gpt_round_waveform_tohw().
 * Dropped extra parameter rzg2l_gpt from rzg2l_gpt_calculate_prescale()
   in rzg2l_gpt_round_waveform_tohw().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
 * Updated rzg3e_gpt_calculate_prescale().
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

Biju Das (11):
  pwm: rzg2l-gpt: Fix period_ticks type from u32 to u64
  dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
  pwm: rzg2l-gpt: Add support for gpt linking with poeg
  pwm: rzg2l-gpt: Add missing newlines to dev_err_probe() messages
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
 .../bindings/pwm/renesas,rzg3e-gpt.yaml       | 323 +++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 379 +++++++++++++-----
 3 files changed, 634 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg3e-gpt.yaml


base-commit: 5b5e33c44a491d5b5e019f527e028bd567a226fa
-- 
2.43.0


