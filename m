Return-Path: <linux-renesas-soc+bounces-32768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNQqOGw4C2qgEgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:03:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3455708AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42DCD305931E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9965E481A8A;
	Mon, 18 May 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gooXQ9tM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C1481AB5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119624; cv=none; b=I3hVeNdtS+qmUCmIixnHDMuyecPpGM670091MbIcdr9TdW+Ku023Nb1O2PvceK7BqyVOMIdjqw/V1cbdgiOWw/7k8Y8YxFY8DQaiwSFvRNW2+2qDW8mtuSFAdYXs0v6lwBkKuRTqxWsO2x3OoE7OWP+7TxOZWRu27EPQqOmuIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119624; c=relaxed/simple;
	bh=ilxXJ6f6ocM13VA/URJIbBBqXtBkN2Q+ruqs2Cl8XYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFoNuABTbkQE2QY1UZMMwvbFziEz6/F0bcSgRdLNBa5c7kc58cin3yPUWVlZbkfe+WBoc5n95IKzLuCX3cPkPcv6CRrd1anSkMJglFOosO84GyoqKyBK61uI6h7HMCH68jBxaGnpvEVS1LXk9Uz8JiamOaueZoVWosQo3RVUN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gooXQ9tM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso15065375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119612; x=1779724412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmgE78suZlMwwBJChVhs0s2vjaTS32du2erStadTtvQ=;
        b=gooXQ9tM/GQEQRs8OsgB52bzqkPnODTR/xxTtxJX7Qi87/5Y6v5lmiY5CxCW+ReCKl
         Dt+cVV7oYneyVB7uPlgJ4abvdmzrv5AVq2nQGH1GxdHXok4NlpAOkKG0uzyLfsDidHb3
         RGkKocbrqeNv5kjxFD6tabvxEkMzzrDBDSyxDm4SJQsKe4AT1h1b0G88HbbJ90AJAGbE
         r6+z6uDDKrci6dVLE69QRbuEd8hjQSBX26Ys9guPengfpbf4AzaAilAe01I3qfg2yld3
         w3Ut/LFpRffT8hcyCkmYVGpYwzS3XeoO1+MNgc03l2BmMeD8Iy6twnPsAeAFqc1Ub4Ou
         dglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119612; x=1779724412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmgE78suZlMwwBJChVhs0s2vjaTS32du2erStadTtvQ=;
        b=HKx3G2IXAz3iZdeu0UbVwx/TGFSkAsTy+5Lzs7jgV1xef8RLSsV0CS3aSGePSTswRo
         Qu+b592PsvuqVmpxsEs1dYjE+bhrBVyP0+krL7jznihaUtzr4kBoSLhB9wLWzwVRBjyp
         KcW0cgIM7ZHZCRQ9P/2JMoAP3snAAqNeoDd818k9BUAzOs8tG2ZfNRDQl0GqjR7y8jQs
         hRvEh5ZTNFQ3Rp1lL8CGRgrNR33oWM3Ggg6IJMs0qXQdGM2ht3bInX8n/Cu0sRpJ+3KX
         xxZhloqnZ4zlT740L7jt4BA3arXQQ1TmBrfds47m45Ww+obsko26is75ZXqnFZffdngM
         dDlg==
X-Forwarded-Encrypted: i=1; AFNElJ8FWJmq297BX/Mn+uiOsXjBmQxvqcpRlVRK2bNexQOuMWBfGIEMW2INDpG40G1kpIiyf8ypjZ5Yj58Zl965CpkIqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JdmidTVekpn/DczM3eTQcs64tciuBz3+kbPnhvZbN+l/kZfl
	WlC2uptxnmzZtT3JPhq/d5lse81iN0KCmQXCuDWYgwTS1k7bvTfa/tTC
X-Gm-Gg: Acq92OFv8tdZ12tTRwGHol/Vdib8D7Sj3i0HO5E/jMHS+Lb77O/FsPOlFgw5pfmP2lt
	O0KmzsrQIYc17NeYSKVXEkkJ71w9k0FpxzTU5ce506z8pvcPVXh7ruZ6RTt4KOz/SAMnhXIbIiX
	+FHZ0DN+uQyRkhjR0XzlSOum8MRpinANOCbnULXTeNPZqLXKOtPeUz0bNmb1SY6UmMrg9Ww3G4W
	NSjDWSWzK9nbQoJmvqmNNl6dMNCex1ct6w6fEkK/VZkM1Mz9zjmQnDNlPAh7vouwavEyqriU/6r
	gFahjyCN7zELv5jFMGGSZh2HbWllSfaM3UMiJMlYHKNfcM7RH9cL+tL0n5x2FMOPQy85qhAFZ+J
	5Z8eFxu9DKHrcng4Vqzax5CucQYJOdlB5h69Qv4s50NPGeGPSij2d6twrvGdkG9tonhKNd01RP0
	+nfNSal06Htq2dM9Ovh84DkYnzzButOzIl2rA6yB5hDkDXMamjksji2PddbzXxnp/c/QqMB2Avn
	W7rqs6EwcGeu2e6kD1+jM8yrZodIiVQJ/8DbwAqxzLtgzUb
X-Received: by 2002:a05:600c:4e46:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48fe60d576dmr255690515e9.11.1779119612345;
        Mon, 18 May 2026 08:53:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Mon, 18 May 2026 16:53:20 +0100
Message-ID: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32768-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,bp.renesas.com,pengutronix.de,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F3455708AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v1->v2:
- Dropped RZ/V2N DT binding patch as it has been merged in the
  pci/dt-binding branch.
- Dropped un-necessary new line in schema.
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
- Updated commit messages for clarity in patches 1-4.

note, the dt binding patch applies on top of pci/dt-binding branch.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  21 +-
 drivers/pci/controller/pcie-rzg3s-host.c      | 229 ++++++++++++++++--
 2 files changed, 231 insertions(+), 19 deletions(-)


base-commit: d2fc550dfe13eef91b065af7a12348ba4162ac04
-- 
2.54.0


