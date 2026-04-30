Return-Path: <linux-renesas-soc+bounces-31776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PAyFSoi82nIxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:34:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4149FDFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C38830059B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9473A0E88;
	Thu, 30 Apr 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJr1URz4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1D3A3828
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541669; cv=none; b=u9aOCJwVjmjWG/Md6nfF/JVkmfjyegDx4Z5aXVFYxxZVlKnhjTKcWqma5mjy3ra1r0iqq4L+zeiQnXzEKpFevUdvzhQrBdV9ZtABVNJjdbIyMW7SV8WOlZMBG1jd4IIWyhHMCYnArUP2rEV6raQczyH3ySnOsHwoBwYXhoVzW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541669; c=relaxed/simple;
	bh=6jA2TVd5eEOSJX75sMck6m6Y4y4DMXDpaG1GvHZkuTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qcoCFROx4kpIGcK2cNmgk8emDrq4hjeE/a3CPIzCoE3SIBgAVnCWQcBbGmiKFpcwyFYQbfjnzaBLX6NW41iHNAlLzxe6sK8ocfknsfz9LA+UuZknax9E3IFCeQraOCalPsJQ6e5Wm+QBXZr3fGqp5LG1ZHmEiTvGfR5OOElZUYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJr1URz4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43eb05b1875so375481f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541666; x=1778146466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvUyUorr1MRTDJfdV4+jBpLC3bms0Zaxx62BaefmQJ0=;
        b=aJr1URz4ts9xKuMcuWLmGq53U5h7G3ZSeEUdjWwkmfbEmSRKQCaksH6Fd0CnK6ef8G
         ijQNKjJ5okRQ3lA4+2yb9wo1a0nqa1QsXZ+jbcM+pTerQL/dr2F7NnE2ZUnFAv6ERdOy
         EnWsk6uq4fpPAegYEifKm5+xIH08T4lKCrZ/WCerRHEFneWFBp43lMDBHL3V5a8kz7Ig
         eRaWOBdePvkZndTC7wJH8uNRlp79kAYJl+Y5DJDSAoV3LngRSlyQLr2CWbUUWy6nh0Db
         wpGx9NdmG16oWBva+MNr1kc2PPO0pFCD+bcZFBP/VgdMOUVzFs+LCxudqOApc+TnHZ3L
         5n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541666; x=1778146466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvUyUorr1MRTDJfdV4+jBpLC3bms0Zaxx62BaefmQJ0=;
        b=qpkTlPb/XlPJgCLuiAlQBu2okbXGn++k11dVcpeR2N9k8jdBEjYq8rbuqKHzQpaMsX
         JAs20MD+d9RhLQWB/PnZeQwPaX+OYTqN8o1OvFoLx/GhKq8pZJWqGNnsG5iGwsuxgkaB
         9l0EN3Zj4L7l39Wy8bQHkVGgSKiGsmyJ8y3XS+B0CLxve7oDLrACOvK4bZNtmvoLZb4C
         TeMExar82V7jxzJBnd1othSEL2t+ClvAG2HRW377ynKgbqLKTcfAtiip/wP18M2/zW1A
         xZGm7exWm8Qn4qtQy+we4VxTUjuhw7ohCrqFppsknZ7SiWmZfWArjv7xgWjYulxsUzGP
         COew==
X-Forwarded-Encrypted: i=1; AFNElJ/aoxt7Uige7b7VLRUPBqC2SPz5lKEaiSRvUin+YuP9kwptwJLrxEWUP2i6mzrGB3ES7BcSUIyPmN0jNGI/8ByVTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2XZwRcBS3OYMjr2hS4SmLdtYLIY0omI5gCM5dj8MCHCq9Wa+
	h81HHkX8u2Ca7HtLDWWM3SfzXX9oTY9VjTsPaH+IkVw2d2NP1PORUwQH
X-Gm-Gg: AeBDieux9SspQ6a1dLSkzEhbk6qNC6yvUzuJk0Mq+J/0NcKGbd2N7LP8fJ4QH0hxVLQ
	QnqlV5vpk2dYprQoLcFBA+n7Lr+5kkRiaylJnGV8OQqb61b0LijKzNCHNbj/u9/16A+07BCSMkL
	z2CWA2LzC+LVcptNVkTT7LfwKYl87k/n7iO2WacgIs6ro2I/lXbM15EXesqJ4ch7R1gxgga1xMI
	kyPszfllXMsJLo8+crQsJ8BTrQRVcx9aKLwGt5WrcZFQojWP/RVB4MrHlaEUTk2jFOgkmdAnQyQ
	aP3QkRgUDHfGpo6VSe0NAKugIS2ja+vk8s5qHJbgYXci2Ec4+9PFUY6qiiIdzY8vE7LO7cItPoI
	r+x6cVZFsHEcv3W/CLK8goXr/kOThcS7igDHhKM1tg6cfmJKI2P1SMmzquOy+8u+4qOTRzDtnrn
	2n9elm8qBRYUs+nD8Cuelh4j9Y6EJWx7xXLa/ZGpMaMPaaeiTt8Vz+8JalmGfGTgvN2aM=
X-Received: by 2002:a5d:64e3:0:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-4493e1c18edmr3288079f8f.18.1777541665576;
        Thu, 30 Apr 2026 02:34:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/7] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 30 Apr 2026 10:34:05 +0100
Message-ID: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AEF4149FDFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31776-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pin-control support for the Renesas
RZ/G3L SoC. The RZ/G3L pinctrl has an OTHER_POC register compared to other
SoCs for setting the IO domain voltage for AWO, ISO, and WDT.

Document the bindings for the RZ/G3L SoC and add pinctrl definitions in
the driver. Some IPs need to set the register IPCONT_SEL_CLONECH in SYSC
to control the clone channel of the IP.

v3->v4:
 * Dropped patch#1 and #3 from the series as it is accepted.
 * Dropped Port P4 from binding header as it does not exist on RZ/G3L SoC.
 * Retained the tag for bindings as it is trivial change.
 * Added a patch to make QSPI register handling conditional.
 * Updated commit description for patch#3.
 * Updated rzg2l_caps_to_pwr_reg() to return mask in addition to register
   offset.
 * Dropped ffs(), using field_get() instead to get PoC offset in
   rzg2l_get_power_source().
 * Simplified rzg2l_set_power_source() by using mask from
   rzg2l_caps_to_pwr_reg().
 * Added scoped_guard() for RMW operation in rzg2l_set_power_source().
 * Added a patch to update rzg2l_pin_to_oen_bit() so that it can reuse on
   RZ/G3L.
 * Dropped extra white spaces in SD0_CLK and SD0_DATA0 entries.
 * Renamed SD0_DATA* → SD0_DAT* to match the pin function spreadsheet.
 * Renamed SCIF_{RXD,TXD} → SCIF0_{RXD,TXD} to match the pin function
   spreadsheet.
 * .pin_to_oen_bit = rzg2l_pin_to_oen_bit() and dropped oen_max_port from
   rzg3l_hwcfg.
 * Updated the data type of func varaible from u8 to unsigned int.
 * Collected the tag.
 * Started using an 8-bit pin mask instead of start and end pin indices,
   and combined multiple entries with the same port number and config
   using ORed values of BIT() and GENMASK(), thereby reducing table size.
 * Started using an 8-bit function mask instead of a function index, and
   got rid of the shared pin bit. This also provides info about the
   possible functions.
 * Dropped RZG3L_CLONE_CHANNEL_{PACK,DTAT,SHARED_PIN_MASK} macros.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PIN_{START,END}_MASK macro with
   RZG3L_CLONE_CHANNEL_PIN_MASK.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PORT_MASK macro with
   RZG3L_CLONE_CHANNEL_PORT_MASK.
 * Updated kernel doc comment for clone register from 'registers' to
   'register'.
 * Dropped dynamic allocation for the clone register cache, instead using
   static allocation in struct rzg2l_pinctrl_reg_cache, as it is a single
   32-bit register.
 * Replaced the LUT and for loop in rzg2l_pinctrl_set_clone_mode() with a
   simple switch statement.
 * Dropped the complex check to find the func match in
   rzg2l_pinctrl_set_clone_mode() by using pin_func_mask & BIT(func).
 * Dropped the inner for loop for finding a pin match in
   rzg2l_pinctrl_set_clone_mode() by using pin_mask & BIT(pin).
 * Dropped field_prep with "val << bit" in rzg2l_pinctrl_set_clone_mode()
   as val is just 0 or 1.
 * In rzg2l_pinctrl_probe(), replaced the temporary variable offset with
   &pctrl->clone_offset.
 * Replaced RZG3L_CLONE_CHANNEL_PIN_CFG_PACK with RZG3L_CLONE_CHANNEL_DATA,
   and replaced clone_pin_configs, n_clone_pins,
   r9a08g046_clone_channel_pin_cfg with clone_channel_data,
   n_clone_channel_data, and r9a08g046_clone_channel_data.
v2->v3:
 * Dropped clk, pincontrol device node and pincontrol support for SCIF0
   and GBETH nodes from this series. Will add this later.
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
 * Updated r9a08g046_gpio_configs[] by replacing the typo AWO->ISO.
 * Added PIN_CFG_PUPD to RZG3L_MPXED_ETH_PIN_FUNCS macro
 * Replaced RZG2L_MPXED_COMMON_PIN_FUNCS->RZG3L_MPXED_PIN_FUNCS in 
   RZG3L_MPXED_PIN_FUNCS_POC macro for setting power source for pins.
 * Added clone channel control support in the driver
v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (7):
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  pinctrl: renesas: rzg2l: Make QSPI register handling conditional
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
  pinctrl: renesas: rzg2l: Add support for clone channel control

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  20 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 485 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  38 ++
 3 files changed, 526 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


