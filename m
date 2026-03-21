Return-Path: <linux-renesas-soc+bounces-30054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF20McQDv2n9pAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 21:47:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B232E73A1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 21:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 922983007B8D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 20:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6932C21F7;
	Sat, 21 Mar 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prxX25FB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369832EB0F;
	Sat, 21 Mar 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774126017; cv=none; b=RuIM+dcL91EmjUqTEjEQIojf/qujtPPwr4oKuV1/pYr/1D3PPmt9hREMwMlVs17OGTTEDeOHRe0pIy++3VQ+KsrQ+qJzGUs+gokXiybuOmP4ZlxaASiSlXCIBrJ/hpWkaw0l2KeIZFfOLRlMSozS8i9TV1DgOfVCAyS7KPBXL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774126017; c=relaxed/simple;
	bh=klkuFutrzMFxyAKycJvuDYoccuxnDqF/tdTzOb5itaE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HHEeKhW0yYf6LEE2Un5wnBQKeVWwkrqODDvhkZsVoGXepIxr2Z3Ze3Ij+NfVb6jMMlAewatdC/+Kbsw3KaWGGNl2p878wUrLqVxeVazCwsr+vX1Wf7AAQRABU5H/QuRC4NnB+ey5cAmXylWXqrhLo4dcw65VciDI0vVH8YZifp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prxX25FB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9E9C19421;
	Sat, 21 Mar 2026 20:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774126016;
	bh=klkuFutrzMFxyAKycJvuDYoccuxnDqF/tdTzOb5itaE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=prxX25FBOWsAtzY32uSjbDVTdexwER1tbRFf4csEK3P5v4Xxa7dssv9ArySMHz6Hy
	 k9SXwLby+i+G05xjkfFOECtSKdbWgI2Ym8j7lPO1vlsONOsutp6nmfIkG41aXz8aTx
	 kPLxGguF2uvj+7gNuuVjRJiURWjamPg6xKQ8CvF+2b/PMp07eF7Tr/JjVq+rBfLRWC
	 5I7VVWIqUC2WaB29+QrP8gwm5LZRjKFlNina3OLgskY8N8z4Ui3RBeZC2/d/WsithC
	 5vR0pjZu4CQopGsev1VujagmEA6RMc/C7pVwNmWHVrw3TwuvYbiExiQMH5MkGMZrJa
	 a1gAKrruoi4VQ==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
 skhan@linuxfoundation.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
 grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, 
 tabreztalks@gmail.com
In-Reply-To: <20260318021921.75-4-dawei.liu.jy@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-4-dawei.liu.jy@renesas.com>
Date: Sat, 21 Mar 2026 21:46:50 +0100
Message-Id: <177412601062.18368.450072825684601974.b4-reply@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=krzk@kernel.org;
 h=from:subject:message-id; bh=klkuFutrzMFxyAKycJvuDYoccuxnDqF/tdTzOb5itaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpvwO8yWwYJg+pP2C7WsRo+crKuyoC5o0mp1YKP
 xFTZz9iWPaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCab8DvAAKCRDBN2bmhouD
 1zc1D/9hF2M4DmbtluqCgcE2Y7lUKfLRVUjFVLP7b535txXT1hjw2rrccNMEp5vN4V3CPenE6jG
 pia9oDa61OdoU/V+HfSIf5ycTwKABaFgxddacNuV1K1chYmpodmJrONwlAp4aRKbqtPlUJi0gAG
 to46pUFNKw3brdPP0KvoxdPeyLjAsWR3Obe+tHVMKzYtptSVZxCd0+KD5nbLZvHM+m33HnvZWaj
 Hr3vdhBusNKxbXIk4PJcr28plxlEGvZ6s9OocGThtuXmDk4R47DiAOheN03c4kIhQHbJ/B03h0w
 54Yx4cbPKejGLry1Xqw2HhDRS8J5oB9OmUJOsr7BlL79IsW+U3nX8JzmjyDEMXKEjqfcc4jt6Y6
 VSnNDfkr1mW7pE0fp+mwX3Mrx3hPsBBl5CSAx84L1QgmNTYUHofN6HxPS+cyC1jB/csVJmQakSP
 TjQSqDSUNDCLPijSMRY3jc1UMdizbqux8SpEvdHcIjWHo32HJEJhV85tK7LEV9PfX3lX48sdsYS
 tB9MpxvYxogWovA18kUqmsHbCBLmhg/3MobR0S9ZsV9temrUfFnj1YW+KCHD6IRcmKu2fCvFym+
 jC1Saio1G8FEvud5wpAce++oa/m7Zb2tVpNDKq5/TjDZ1sRv5qlCGx5au1piPEVGfSH6V04h0Kx
 8TxHF7Hl1CErnXA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30054-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 66B232E73A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-18 10:19 +0800, Dawei Liu wrote:
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..53d07c0ce 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -56,6 +56,8 @@ properties:
>        - renesas,raa228228
>        - renesas,raa228244
>        - renesas,raa228246
> +      - renesas,raa228942
> +      - renesas,raa228943

If they are compatible, maybe finally this binding should switch to
representing this with fallback?

Best regards,
Krzysztof



