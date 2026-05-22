Return-Path: <linux-renesas-soc+bounces-32969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIvfN1BIEGrzVgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:13:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 588ED5B3A56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E9E3003519
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556DA376A1A;
	Fri, 22 May 2026 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GMfPkNhz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C591DE2AD;
	Fri, 22 May 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451981; cv=fail; b=hP4aoX5Ut9SZXNMe8eZqU8ZCTvoqqCkzTnd5tEbBNjVNBc7FENnOMC+qE+G2hW3W/lvLPhjeBdA2bEGUfuvc9wbYAGRTfISxYw6v+EXIfMCJjylN1d2m4q5EO4yPB5KN6Zd1wuG2ccvX8x3R+EIQSYzAtJh9tP2YglhCGrfm5uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451981; c=relaxed/simple;
	bh=bXbo8ys9oItkPxxpMGA/GMnS6qXYebxQIaiaGmbSsXM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=miH28h4TBMgt7VyDoDdSC65qGQSXWE64/Ty+tF/bhOjL6EZdKwIHSeqA7xW4cNZPZH5roM3cg/Kb+YGjGLajmYCqVGTMF9np4zOinT9SWJnCyBLAcQsbtOXi5uoeCxl0R1W9KAUSRpzkMczlkkSSOCM6lhCIxKh4M6BglnFUfqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GMfPkNhz; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRVOnLTmNeab2a3xltrsA+pMzpp9leDlKaeQgQGmQdTS/Zj8YeRR1N2x+UJ3pPWtvGS5fDMxAluDQdyKFWvy9kOzWYh1irNx/M+C9+1Rjj9yYYj01WGJJqy2tgIXr38tbpxEud1WVtl7KyjLYRXG3qo839qov8U8rvwsb6IyF6PGPopDVTNeqLXoPSqvjtP3QOCYxPs07KdL3/7dFiKDaNgXGy3vxXCbD0hLlC64Gntyafr91VVo9UvL5C6hRi5AcjNiLgxRpBDg/5mNDP9Q2gNhnw8yApSwMp0lRMHWkPkYI9vIxU2WBB2Epfin/7pMqB1OaHWZaGNXsyJtVSdV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir8zaXjF+6r3Dm9663T/MmekhVKC1KojEeKnFe07bvo=;
 b=PVLotgq4GZ9etm2lBxouaf1vo8MIujkjr11EIugxGjc6RKFfjtpcJU8DPFlB/iw+O8yuOGN5/+GJkOwk/TY7xS7uGAkYb3/mFghhrnOIRu4xYoc7q69LoX5GICEUnxh4qHUF0joRtw/jXqT1yGAxOUpgYEU14FoqScqNk5f4RAuWOzeL+/4t7h6GkNfTMlJtU4uG8EuSo5E0z/lubrEZM8Ah7QLA+eWd8AvLVvxmmuK1McNN+MWyRIqPF43FOz6Oou6kjdjvLC1iV63xnsGFm1wlZy1awcwIUeWEXGcDZqmAk5JjGBKmR+REfjGcBC/eR7BQ6cWuU1GWYXwFLW5OXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir8zaXjF+6r3Dm9663T/MmekhVKC1KojEeKnFe07bvo=;
 b=GMfPkNhzQLlV4XDGnyUDTzNlmwqztHg8wtBsLJsBELh781kBsa+CzNCOZnEhUqJShSzOvDC1PISyFR9onPrT3LE0Epf9tgO98MaZLaGY+JZeomrcZcGjOPXc1xvqOJS5l9un8nHgzDrfiX87/qXUhxV1/TWuWMQ5LoxOGQQ8kuY=
Received: from TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:7c::10)
 by OSCPR01MB14314.jpnprd01.prod.outlook.com (2603:1096:604:3a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 12:12:48 +0000
Received: from TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c:cafe::b4) by TYCP286CA0353.outlook.office365.com
 (2603:1096:405:7c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF0000501F.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:12:47 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 2D33E3000458;
	Fri, 22 May 2026 21:12:43 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [net-next PATCH v5 00/14] net: renesas: rswitch: R-Car S4 add VLAN
 aware switching
Date: Fri, 22 May 2026 14:12:29 +0200
Message-Id: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1IEGoC/23N3YrCMBCG4VuRHBvJTJq2euR9iMg0P9vA2koiU
 ZHeu6MerIs9fD+YZ+4i+xR9FpvFXSRfYo7jwGGWC2F7Gn68jI5boMJaASqZ8iWebX8g5w7ll4Y
 s9bpq2y50uK6t4LtT8iFeX+Zuz93HfB7T7fWiwHN9axqaGa2AVFKTabpAKqCDbfKDz5RXdjyKp
 1fww8BZA9lwTai0aS1T9G3oD0PDnKHZsJoR6MAaU38b1Z9hYNao2CBDiCa0gcj/N6ZpegDtry9
 ygAEAAA==
X-Change-ID: 20260120-rswitch_add_vlans-39488bfb296c
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=5190;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=bXbo8ys9oItkPxxpMGA/GMnS6qXYebxQIaiaGmbSsXM=;
 b=Fv96i3RNZ8+mz30W2IVcuqTnoBMwl7ApFsmow4LYg7vDXWUJ7x+7kmC1FNxnOWxHnI8IiozVz
 T2svGPU9rTbApu+GCWG7TDLa4Grt6CD+V4Jl7HUn/l38M7W/N40LZgI
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF0000501F:EE_|OSCPR01MB14314:EE_
X-MS-Office365-Filtering-Correlation-Id: f75198e3-0ad9-4254-ca4b-08deb7fb6fef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|13003099007|56012099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3icwNf0xs0YbCHt2Ib7brXk10hzJ19LZ2X8wofbxZ3vK40+RsUfEWItp4e94cR4VuxSDKoH5VNCRxYEBbIjVhrA9aRuQymVbKvaPRb4tGb4kBw56zpXej375Jw/fDpeJ7TWvnFGquVLp9WFRWaNYw6nr7YRmCyqfn2IP5pbCyWNg1Hv9cf95GgH2he41Lk0rN63wJegVkm5BKASYMfElVIhk7XYhrDh7kbfFFTztdHCpp9vggWhQLqVBuGCi4JGLrQ7cMh9HYI1dltlhVIcWFbfxxW7yfSb7gykCQ+lf33uVIxLeodcFkSE3DfghwPZkghpA6yE3jqfesJbrZs+5FCZb7gY4HMUP/9D8wnDTsBs6rFpoui+2xAejEKJBjHVgdueJfzeTPm9B28eHYBp5aaIsf/ncnoJtneuvXiCAnwdUQOhVmYAwcQvX3SLeOALxv5JuKA1opLWbNqMYCPbBlqZhcVm5AEaY5LgW0GvNaI05yrPYLnc1N8YLT+2FkE2uCvI6XbVmWOO2ZChi59dA4Ji2GWkGYIsDkEtqxQsFiejH1UDRdv9nFYapakwixBWxoXBB9/9iZdVazfPFffrpEHeWU3NZy5O08x5uCgsWsM8ToA8KJJmIXCDcf75jksEy3mR0X69UpleTbR4287tecyCVXxAfmYKDpCoJpBjGIBABgFe6RIemqhYKnwcw396LQOqhR7N4gZdkEWte1Kqjgs+pX8/2VrxabI/ULlTVEQw=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QRdA6glR842FgiJ2l9B2ZOVkZedKGMveoYmCWNwREn974S/2bMHkiS9MRdwuJihagL6LSloisCLOD6frgAT8MKoFjiaAnSdVnLXbwzjmeKdD9ZDT/HEAQ6A8/rxk7hmSUniDo/WagHvTPQ8fncyXM0WuVxTdXxwP7HYCiMluIxCkO98Ffy70f5NuewSBobW6Eai34KO5Huv3GMdWjtcB8Wydu3ijV5AEp/iyXLBs3CeOYGSWZGGTan8JD2eRuyT8x2TTwwqLgR0qTG4Fb2UqL2Q6mTGanfXnwTg61yPPHT+xqy7IdtRY5ba56tTzD2veJKzxhcX317kv+rhRO1trbvwxU/DPfIPFBW/RxQFSWCb8X7Se5sZyRkEkzOy6v/RQVZAon16QbwgS7AjB8AAEFamii5S7DgHoI9TVXhJ5gwbLQMi5LGdOgNCjwe2fLRzj
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:12:47.5328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75198e3-0ad9-4254-ca4b-08deb7fb6fef
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14314
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32969-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 588ED5B3A56
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

7. Add locking to protect CREC and RCDC clock register from concurent
   accesses.
   
8. Add basic start-up time initialization needed to support VLANs.

9. Update ETHA and GWCA port HW initializations.

10. Clean up is_rdev() rswitch_device checking.

11. Provide struct rswitch_private to notifiers.

12. Add handler for FDB notifications to configure bridge MAC address
    to GWCA registers and update static MAC table entry.

13. Add vlan support to L2 HW bridge.

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
Changes in v5:
- Added NULL checking for calls to skb_free_frag() and revoked hw ownership
  by clearing desc.die_dt.
- Added locking for queue swapping in the rx interrupt and bounds checking
  for spn reading.
- Added locking for clock registers.
- Fixed initialization of GWVCC.
- Fixed return codes of rswitch_switchdev_blocking_event().
- Added clean-up should rswitch_register_notifiers() fail.
- Reworked reference tracking.
- Added flushing of work from system_long_wq.
- Link to v4: https://lore.kernel.org/r/20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com

Changes in v4:
- fixed error checking in rswitch_gwca_change_mode() and rswitch_etha_change_mode().
- fixed typo in use of GENMASK macro.
- fixed comments from // to /* */.
- fixed shared queue ussage in rx interrupt.
- fixed assingment of fwpc2_clr in false branch.
- moved PORT_ATR_SET to rswitch_switchdev_blocking_event() to remove dead code.
- changed from dev_put/dev_hold to netdev_put/netdev_hold.
- reordered code to make sure the correct type is accessed with info->obj->id in
  rswitch_port_obj_add()/rswitch_port_obj_del().
- Link to v3: https://lore.kernel.org/r/20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com

Changes in v3:
- Fixed findings made by coccicheck
- Fixed missing 'depends on BRIDGE' in Kconfig found by test robot.
- Link to v2: https://lore.kernel.org/r/20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com

Changes in v2:
- Reworked reswitch_update_l2_hw_forwarding_gwca() as suggested.
- Fixed missing initialization found by test robot.
- Link to v1: https://lore.kernel.org/r/20260317-rswitch_add_vlans-v1-0-3a57bfa0f2d1@renesas.com

---
Michael Dege (14):
      net: renesas: rswitch: improve port change mode functions
      net: renesas: rswitch: use device instead of net_device
      net: renesas: rswitch: fix FWPC2 register access macros
      net: renesas: rswitch: add register definitions for vlan support
      net: renesas: rswitch: add exception path for packets with unknown dst MAC
      net: renesas: rswitch: add forwarding rules for gwca
      net: renesas: rswitch: make helper functions available to whole driver
      net: renesas: rswitch: add locking for agent clock control
      net: renesas: rswitch: add basic vlan init to rswitch_fwd_init
      net: renesas: rswitch: update port HW init
      net: renesas: rswitch: clean up is_rdev rswitch_device checking
      net: renesas: rswitch: add passing of rswitch_private into notifiers
      net: renesas: rswitch: add handler for FDB notification
      net: renesas: rswitch: add vlan aware switching

 drivers/net/ethernet/renesas/Kconfig        |   1 +
 drivers/net/ethernet/renesas/rswitch.h      | 187 +++++++-
 drivers/net/ethernet/renesas/rswitch_l2.c   | 649 ++++++++++++++++++++++++----
 drivers/net/ethernet/renesas/rswitch_l2.h   |   6 +-
 drivers/net/ethernet/renesas/rswitch_main.c | 320 ++++++++++----
 5 files changed, 975 insertions(+), 188 deletions(-)
---
base-commit: c26d7040520c4341b719063378d0bb6d7bc2d67f
change-id: 20260120-rswitch_add_vlans-39488bfb296c

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


