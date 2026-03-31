Return-Path: <linux-renesas-soc+bounces-30628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ETgFP2Cy2l4IgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:17:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECD365F70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A095300A75A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8893C3D8117;
	Tue, 31 Mar 2026 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="rT/69nN0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23F395260;
	Tue, 31 Mar 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944689; cv=none; b=eJ8VkPVHmgw3a6dv8ObrAzIxDP8Kanmy+Ow1l+jpgLd5BlZjGW06apuU8Sa2Z4/++IWR/f9pQkXTsuVuIHNAQkC+mxT94mSHxCUuzgIsZZGGhqUscMn8D6MxcXs8+b6E+RkoMTCOjlcKNIoxhwzrZmqfLB2oVoaI+aPiQjiZ/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944689; c=relaxed/simple;
	bh=IzlQBO+/3QQz3rVMzlmBSof9s5dhYvYhh5ZoECloaCA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Obcz54GdGOtk38ieHo3B3D23M1+vEoJiUVI//oD3XahQPUlethxkQbzEbHkOBtNwn6n/hUIjEoYCcYvb39rFx3H7nQQCD0Ei2PpbtgnbsBZp0lWbXvjvatos+RCNSMdMfRwO2Bw0t0Zz7VfAeCasJQqM1eEXiSJMRzatyUleXd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=rT/69nN0; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F13D6A56FC;
	Tue, 31 Mar 2026 10:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1774944679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7yru7aj8vqfA/2tCvRfrvT/SZN7TZtsZe7Vulo0NEjA=;
	b=rT/69nN08jcOmwrnSKEpNHMVTfQAtZ0FRsfQIzTyeTbTvuEcGcQq4XLuBZAr/wqJXwAsFO
	BodE5QZlfm6RT8R05PAphBSB+ap6Mzn5tiv2/axeT2lHqYYivAnpn0z91P254oG8S2dZ3v
	2DOoGWwDjmn100p7q1omrCQrkQr/fzDwPsHolwsmUAre2MMbfUuLqAbcS+qmT9Fvq7B+xh
	Np2VYbW091RytzuXjOAMClgfp/s/Mmt4TOl3Dy4Seg9WAGxzfOvkrvnKSZGLeIXZvAjZ8q
	24CygUWzF7MqHXJ/XJaRAPRAjFmK00V9CNefmV/yQmBDt9Vgifz0S+eHqeQN7g==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 10:11:16 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Michael Dege <michael.dege@renesas.com>
Cc: kernel test robot <lkp@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
In-Reply-To: <TY4PR01MB142828994B921A75367AEC5368253A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
 <202603300436.ryIgiB0z-lkp@intel.com>
 <TY4PR01MB142828994B921A75367AEC5368253A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Message-ID: <b52623fe930b5c398f21d97f7069274a@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tipi-net.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[tipi-net.de];
	TAGGED_FROM(0.00)[bounces-30628-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nb@tipi-net.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tipi-net.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7ECD365F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.3.2026 08:10, Michael Dege wrote:
> Hello,
> 
> Who can kindly help me with this?
> 
>> -----Original Message-----
>> From: kernel test robot <lkp@intel.com>
>> Sent: Sunday, March 29, 2026 10:37 PM
>> To: Michael Dege <michael.dege@renesas.com>; Yoshihiro Shimoda 
>> <yoshihiro.shimoda.uh@renesas.com>;
>> Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller 
>> <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni 
>> <pabeni@redhat.com>
>> Cc: oe-kbuild-all@lists.linux.dev; netdev@vger.kernel.org; 
>> linux-renesas-soc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Michael Dege <michael.dege@renesas.com>
>> Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan 
>> aware switching
>> 
>> Hi Michael,
>> 
>> kernel test robot noticed the following build errors:
>> 
>> [auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]
>> 
>> url:    https://github.com/intel-lab-
>> lkp%2Flinux%2Fcommits%2FMichael-Dege%2Fnet-renesas-rswitch-improve-port-change-mode-
>> functions%2F20260329-
>> 154812&data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8dd3108a%7C53d82571da1947e4
>> 9cb4625a166a4a2a%7C0%7C0%7C639104134822998103%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uP5U8NPFi2wo7VJDRGZ%2B
>> ubwH50bZDvNuapBP0t76lL0%3D&reserved=0
>> base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
>> patch link:
>> https://lore.kernel.org/r/20260327-
>> rswitch_add_vlans-v2-13-
>> d7f4358ca57a%2540renesas.com&data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8dd31
>> 08a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823016624%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
>> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
>> 2QTz%2BFk8tDeHuE2Ac5ddl8tJ2mFSrm9l9mGnnLDsdW4%3D&reserved=0
>> patch subject: [PATCH net-next v2 13/13] net: renesas: rswitch: add 
>> vlan aware switching
>> config: arm64-defconfig
>> (https://download.01.org/0day-
>> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
>> lkp%40intel.com%2Fconfig&data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8dd3108a%
>> 7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823028947%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
>> kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vhwu
>> KaGAF4bhfSTb1VhDnII4SXsKbZ0zEPRt8ma49aM%3D&reserved=0)
>> compiler: aarch64-linux-gcc (GCC) 15.2.0 reproduce (this is a W=1 
>> build):
>> (https://download.01.org/0day-
>> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
>> lkp%40intel.com%2Freproduce&data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8dd310
>> 8a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823040554%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
>> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Y
>> TddyGPjtxfccjUPlLwizqOqUHOuiRxPxMqoNaHWW%2Bk%3D&reserved=0)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of the same
>> patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>> | https://lore/
>> | 
>> .kernel.org%2Foe-kbuild-all%2F202603300436.ryIgiB0z-lkp%40intel.com%2F
>> | 
>> &data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8
>> | 
>> dd3108a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63910413482305219
>> | 
>> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
>> | 
>> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=4B
>> | 1hVOdPuyjze1HZCUi2v3gamNPgyeYcmx5NNzrDFjw%3D&reserved=0
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in 
>> function
>> `rswitch_port_obj_do_add_gwca':
>> >> drivers/net/ethernet/renesas/rswitch_l2.c:443:(.text+0x11e0): undefined reference to
>> `br_vlan_enabled'
>>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in 
>> function `rswitch_port_obj_do_add':
>>    drivers/net/ethernet/renesas/rswitch_l2.c:412:(.text+0x135c): 
>> undefined reference to
>> `br_vlan_enabled'
>> >> aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.c:423:(.text+0x13bc): undefined reference
>> to `br_vlan_enabled'
>> 
>> 
>> vim +443 drivers/net/ethernet/renesas/rswitch_l2.c
>> 
>>    402
>>    403        static int rswitch_port_obj_do_add(struct net_device 
>> *ndev,
>>    404                                           struct 
>> switchdev_obj_port_vlan *p_vlan)
>>    405        {
>>    406                struct rswitch_device *rdev = netdev_priv(ndev);
>>    407                struct rswitch_private *priv = rdev->priv;
>>    408                struct rswitch_etha *etha = rdev->etha;
>>    409                int err;
>>    410
>>    411                /* Set Rswitch VLAN mode */
>>    412                iowrite32(br_vlan_enabled(rdev->brdev) ? 
>> FIELD_PREP(FWGC_SVM, C_TAG) : 0,
>>    413                          priv->addr + FWGC);
>>    414
>>    415                err = rswitch_write_vlan_table(priv, 
>> p_vlan->vid, etha->index);
>>    416                if (err < 0)
>>    417                        return err;
>>    418
>>    419                /* If the default vlan for this port has been 
>> set, don't overwrite it. */
>>    420                if (ioread32(etha->addr + EAVCC))
>>    421                        return NOTIFY_DONE;
>>    422
>>  > 423                if (br_vlan_enabled(rdev->brdev))
>>    424                        rswitch_modify(priv->addr, 
>> FWPC0(etha->index), 0, FWPC0_VLANSA |
>> FWPC0_VLANRU);
>>    425
>>    426                rswitch_modify(priv->addr, 
>> FWPC2(AGENT_INDEX_GWCA),
>>    427                               FIELD_PREP(FWPC2_LTWFW, 
>> BIT(etha->index)),
>>    428                               0);
>>    429
>>    430                return rswitch_port_set_vlan_tag(etha, p_vlan, 
>> false);
>>    431        }
>>    432
>>    433        static int rswitch_port_obj_do_add_gwca(struct 
>> net_device *ndev,
>>    434                                                struct 
>> rswitch_private *priv,
>>    435                                                struct 
>> switchdev_obj_port_vlan *p_vlan)
>>    436        {
>>    437                int err;
>>    438
>>    439                if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
>>    440                        return NOTIFY_DONE;
>>    441
>>    442                /* Set Rswitch VLAN mode */
>>  > 443                iowrite32(br_vlan_enabled(ndev) ? 
>> FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr +
>> FWGC);
>>    444
>>    445                err = rswitch_write_vlan_table(priv, 
>> p_vlan->vid, AGENT_INDEX_GWCA);
>>    446                if (err < 0)
>>    447                        return err;
>>    448
>>    449                /* If the default vlan for this port has been 
>> set, don't overwrite it. */
>>    450                if (ioread32(priv->addr + GWVCC))
>>    451                        return NOTIFY_DONE;
>>    452
>>    453                return rswitch_gwca_set_vlan_tag(priv, p_vlan, 
>> false);
>>    454        }
>>    455
>> 
> 
> The function br_vlan_enabled() is exported from br_vlan.c and the 
> header file is if_bridge.h. Can anyone
> give me a hint what might be wrong?

Looking at the other switchdev drivers, I'd suspect that 
`RENESAS_ETHER_SWITCH` is missing `depends on BRIDGE || BRIDGE=n`, which 
guards br_vlan_enabled().

Nicolai

> 
> Thank you and best regards,
> 
> Michael
> 
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-
>> tests%2Fwiki&data=05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08de8dd3108a%7C53d82571da
>> 1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823063970%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl
>> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=wG2VKo2Ln60Ld4KV
>> 8wHTcxRyskg0hzu0dZSVMg4v73g%3D&reserved=0

