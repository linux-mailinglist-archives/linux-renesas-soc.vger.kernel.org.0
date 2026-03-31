Return-Path: <linux-renesas-soc+bounces-30633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEcWFzycy2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:04:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBF3678BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ABAD300B1A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C403A6B6E;
	Tue, 31 Mar 2026 10:04:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159DC3914E4;
	Tue, 31 Mar 2026 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951454; cv=none; b=ZMTXCekq4YhYVxqi2bkPZ0gT0sukvs5R8QKqLO3ulQDTCvEjCJ9PyWWw7S+r5wo2bvU4Gk0glf06EX9bibpRhPdWsPEcdhU2S5KenJHnjY8I+B++BByYJ5PcvUVNiIM61RJ/+0dS8LgAq0jhmZ3TFxU27PLlCSjzhimORcMIbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951454; c=relaxed/simple;
	bh=w3wxS6yOPB6Vy1IAlvKoI3Ac8+ZTC2WGkuVdtprbQ78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CknpcygrHOcPH1OUGe7g7qEWqoP2ZuMl5r+8SwNiSeLLbYcWhQPPfGPtBHGb9h3OLj6zH6bVXzfWN266A4QR1ASKJNzKH+ykJjGYzi/2nuABET5UCabGyDC9gx/8urPFLZGOeR8Kes6UiK7JjiSmYpVvIWLTrEyQXVK3oC4OJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Oo1HVISrReeeA+sEd88EpQ==
X-CSE-MsgGUID: Jogw3OSISEaBJ4KlwV/XVQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:06 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6AFEE416C39F;
	Tue, 31 Mar 2026 19:04:03 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [net-next PATCH v3 00/13] net: renesas: rswitch: R-Car S4 add VLAN
 aware switching
Date: Tue, 31 Mar 2026 12:03:54 +0200
Message-Id: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAucy2kC/23NywrCMBCF4VcpWRtJJr2vfA+RkuZiA5pKpkSl9
 N1N60ahy//AfDMTNMEZJG02k2CiQzf6FOKQETVIfzXU6dQEGJSMA6MBn25SQye17uJNeqSiyeu
 6tz00pSLp7hGMda/NPF9SDw6nMby3F5Gv61cTvNrRIqeMCllUvZXMguanYLxBiUc13snqRfgxY
 NeAZOjK5qKoVaLkv7EsyweU2bJe+AAAAA==
X-Change-ID: 20260120-rswitch_add_vlans-39488bfb296c
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=3793;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=w3wxS6yOPB6Vy1IAlvKoI3Ac8+ZTC2WGkuVdtprbQ78=;
 b=QsGb0Qps0ziuJlezfBQJw80sLcNCtkyEAfkzulhGxEL8sgmeHMGjozA8qKSnY73aLVg286nhW
 GC/Y9ne/O/kDZBP2cSN99xzcnmOphLQBucwfJnftYoKxmWo6l13a8Nz
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30633-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.845];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: F2DBF3678BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello!

The current R-Car S4 rswitch driver only supports basic HW offloading
for L2 switching/bridgeing. This patchset extends the driver with
support for VLAN aware switching.

1. For every port mode change from configuration to operation and
   vice-versa you need to change to disabled mode first. The
   functions rswitch_<port>_change_mode now take care of this. 

2. In upcomming changes for adding vlan support struct net_device
   will not be available in all cases, therefore use struct device
   instead.

3. Fix typo in register define macro and remove duplicate macro.

4. Add register definitions needed fo vlan support.

5. Add exception path for packets with unknown destitination MAC
   addresses.

6. Make the helper functions rswitch_reg_wait(),
   rswitch_etha_change_mode() and rswitch_etha_change_mode()
   available to the whole driver.

7. Add basic start-up time initialization needed to support VLANs.

8. Update ETHA and GWCA port HW initializations.

9. Clean up is_rdev() rswitch_device checking.

10. Provide struct rswitch_private to notifiers.

11. Add handler for FDB notifications to configure bridge MAC address
    to GWCA registers and update static MAC table entry.

12. Add vlan support to L2 HW bridge.

Configuration example:
ip link add name br0 type bridge vlan_filtering 1
ip link set dev tsn0 master br0
ip link set dev tsn1 master br0
ip link set dev br0 up
ip link set dev tsn0 up
ip link set dev tsn1 up
bridge vlan add dev tsn0 vid 4
bridge vlan add dev tsn1 vid 4
bridge vlan add dev br0 vid 4 self
ip a a 192.168.1.20/24 dev br0
ip l a link br0 name br0.1 type vlan id 1
ip l a link br0 name br0.4 type vlan id 4
ip a a 192.168.2.20/24 dev br0.1
ip a a 192.168.4.20/24 dev br0.4
ip link set dev br0.1 up
ip link set dev br0.4 up

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
Changes in v3:
- Fixed findings made by coccicheck
- Fixed missing 'depends on BRIDGE' in Kconfig found by test robot.
- Link to v2: https://lore.kernel.org/r/20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com

Changes in v2:
- Reworked reswitch_update_l2_hw_forwarding_gwca() as suggested.
- Fixed missing initialization found by test robot.
- Link to v1: https://lore.kernel.org/r/20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com

---
Michael Dege (13):
      net: renesas: rswitch: improve port change mode functions
      net: renesas: rswitch: use device instead of net_device
      net: renesas: rswitch: fix FWPC2 register access macros
      net: renesas: rswitch: add register definitions for vlan support
      net: renesas: rswitch: add exception path for packets with unknown dst MAC
      net: renesas: rswitch: add forwarding rules for gwca
      net: renesas: rswitch: make helper functions available to whole driver
      net: renesas: rswitch: add basic vlan init to rswitch_fwd_init
      net: renesas: rswitch: update port HW init
      net: renesas: rswitch: clean up is_rdev rswitch_device checking
      net: renesas: rswitch: add passing of rswitch_private into notifiers
      net: renesas: rswitch: add handler for FDB notification
      net: renesas: rswitch: add vlan aware switching

 drivers/net/ethernet/renesas/Kconfig        |   1 +
 drivers/net/ethernet/renesas/rswitch.h      | 181 +++++++-
 drivers/net/ethernet/renesas/rswitch_l2.c   | 639 ++++++++++++++++++++++++----
 drivers/net/ethernet/renesas/rswitch_l2.h   |   6 +-
 drivers/net/ethernet/renesas/rswitch_main.c | 203 ++++++---
 5 files changed, 874 insertions(+), 156 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260120-rswitch_add_vlans-39488bfb296c

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


