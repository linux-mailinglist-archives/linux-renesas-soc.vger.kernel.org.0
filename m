Return-Path: <linux-renesas-soc+bounces-33050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJhDM8yAEWo4mwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:26:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE15BE7E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FC8B300F954
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1944E372ED6;
	Sat, 23 May 2026 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsI/6f3K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E92D781B;
	Sat, 23 May 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531977; cv=none; b=rhaCEguh5bRN6kmFE+fN0MjrgMhvbH6vjwzDRTpQIygej4S3SAoCf7hDDTfexbWKMsG0A6GGm2A4426tpFPjtyR7qUV9zvXb4L7Nh049+LjnHw3m1vjVAeQRxwCmCo6Jb9sI8MZvuaa8UtOx4J+N7+FMt4bOPTL0+3h22uDCljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531977; c=relaxed/simple;
	bh=7FQ8hdsu6D51IfFdatJjGDcmvSPa90/Qs7thjJHUqJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9QHjtZDIWSxQH4XNp+CFoYhLPsAh89/PoaDhpQ15HY6BPgQMnOVft6y4KfSFgXrrh1K1HM0wBSPY6j/ZrtXCA68XNVwFojtVYiqw6eTsN+MQBGOjf3W4i72Zg208gGSp89KVquh51pImnq89oMuVH6xsT9Ln3xWBHdJUQl02xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsI/6f3K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A721F000E9;
	Sat, 23 May 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779531975;
	bh=zg0BMpcJGdRhMwcv7oWgWGvnbS4a0TigRFF8ryZrM78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gsI/6f3K2og6R14AdMJX9N1SU1rJ4bwKxPmx7FpAn0jAouIRoCEfh7gSLTdDC39LI
	 JepXtdRoV7lG47cwVOUPe8+EYq2+oaKmHannXLUGfaHKin1+tH+H7JCIRd4AiC6Id8
	 kgVN8OVnGQ/zgWsw3Gf6wa2+B8DPSldsjIkNyaZZ1PI7ap1ifsTlHjgZGMxz/vp6Qx
	 +5Mr5XwvD9SowPoBjwaSFjCGv54/hc7Sjzyw+PMIXS/oP7/A4ZP4UidRqYLOJzAyC+
	 4sY9181x7M4TNyGiR2nGPlWU6Z17S4tZCs567eEC5n6ITsaNQsS0eKAGXssuhrRZil
	 rQScWOZ3gpAcg==
Message-ID: <4a82fe83-338b-46c0-b783-836256a28858@kernel.org>
Date: Sat, 23 May 2026 13:26:09 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] i3c: renesas: Perform Dynamic Address Assignment on
 resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-8-claudiu.beznea@kernel.org>
 <ahCrpz-J8a5HQSmY@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCrpz-J8a5HQSmY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33050-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:url,renesas.com:email,intel.com:email]
X-Rspamd-Queue-Id: 3EBE15BE7E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 22:16, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:05PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC supports a power saving mode where power to most
>> SoC components, including I3C, is turned off.
>>
>> On systems where the I3C devices also loses power during suspend (e.g. NXP
>> P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
>> 2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
>> resume.
>>
>> Running DAA in the controller resume path restores communication. However,
>> DAA relies on interrupts for TX/RX, which are not available in the noirq
>> suspend/resume phase (unless they are wakeup interrupts). For this, the
>> suspend/resume callbacks were moved out of the noirq phase. Currently,
>> there is no identified use case on either the Renesas RZ/G3S or Renesas
>> RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
>> the noirq suspend/resume phase.
> Can you referhttps://lore.kernel.org/linux-i3c/20260512121732.406009-1- 
> adrian.hunter@intel.com/T/#mafdc9631a2a18dfebfa5b5efcb8584d32bceba7f
> 
> which defer DAA to workqueue.
> 

I've reviewed this series and tested it. Tests passed on my side.

According to the following diff from patch 6/8 [1]:

  /**
   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
   * @master: controller
@@ -1878,9 +1889,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller 
*master, bool rstdaa)
  	if (ret)
  		goto out;

-	i3c_bus_normaluse_lock(&master->bus);
-	i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	queue_work(master->wq, &master->reg_work);
  out:
  	i3c_master_rpm_put(master);

only the registration of the new devices is deferred. The RSTDAA command is 
still sent according to the following code in i3c_master_do_daa_ext():

	// ...

	if (master->shutting_down) {
		ret = -ENODEV;
	} else {
		if (rstdaa)
			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
		ret = master->ops->do_daa(master);
	}

	// ...

which is what fixed the communication with the I3C devices I used in my testing, 
in resume case.

If I remove the i3c_master_do_daa_ext() call from renesas_i3c_resume() then the 
I3C devices are not working anymore after resume on my setup.

Also, the i3c_master_do_daa_ext() call in i3c_hci_resume_common() remains 
unchanged [2] in series [1].

So, could you please let me know if I misunderstood your comment and if there is 
anything that should be done for this patch?

[1] https://lore.kernel.org/all/20260512121732.406009-7-adrian.hunter@intel.com/
[2] 
https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/i3c/master/mipi-i3c-hci/core.c#L848

-- 
Thank you,
Claudiu


