Return-Path: <linux-renesas-soc+bounces-30577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAzOHp5yymnG8gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 14:54:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ABD35B583
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 14:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CC223006537
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DCA3CAE89;
	Mon, 30 Mar 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1VfICwb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097630E0F8;
	Mon, 30 Mar 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875084; cv=none; b=Fq+LahwKIv73iHu8yP9OOcXkziIK+6TYKM/ODBb2fGqVA3fHbLw4BYtubxp/C8AGzBYZEi3CoIbxNOIVYqlkMsZuDnR6pdPKI6tIxtZ+xjlCWal0X/KTkyae/Plpzv3k3hYLL2uogNdT82ClF9aklAndayKgnYJs33yPUjtY55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875084; c=relaxed/simple;
	bh=8bWW/KZZTr5eXqMQBWSZEIrv8SgQAoeahWQfpUbb+0Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dcYnAphxurmeZO3ZjJHc/hbLcXgcaKZEl+xkioCC/uIL4B4KqjQo+bCF87eDbDcN5TOHCkyfJe5UDJbsF6N4fOA2VTWxKtUqz61tnB0ncX21i6OPtSrJu2A5SnL4mIEd+vp/UOgneItk6bpkZ4e2MfxG4hmhv1QZlnVb/XL6S34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1VfICwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16C0C4CEF7;
	Mon, 30 Mar 2026 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774875084;
	bh=8bWW/KZZTr5eXqMQBWSZEIrv8SgQAoeahWQfpUbb+0Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D1VfICwbx71VBAanzB9+6jaBrn1/zKNp3ISCWtfo44Bdt8SkYHLru+9cC6qJheObn
	 nsWMH46l9jtGytZ1drwIMmMy/ZuPy50N+bi2DvcJSW887kf3Jgm9KfB2zCVGyAGcDl
	 EK4sCx+wUVFfSVM8GcjvNs6qfWCpA9KfgQLQQt2vPSIGzA0w2b/7ouoZ5PIrXP4oM4
	 U1yzF28+dB72BClYlaAL+fMxO3/EJXmQn6fRchgkXRTAGNsI/T+ZhLDdQzJhElNJml
	 3Fh+U4z0uU1ZmjQMkS4wGfZJL8+wXC/vsq9XeFLmSo/YP5BYj08s+q62xtvlom4fvF
	 uUxgSA7cKNDtw==
Date: Mon, 30 Mar 2026 07:51:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, jonathan.cameron@huawei.com, pjw@kernel.org, 
 palmer@dabbelt.com, conor+dt@kernel.org, aou@eecs.berkeley.edu, 
 alex749@andestech.com, az70021@gmail.com, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 geert+renesas@glider.be, alex@ghiti.fr, magnus.damm@gmail.com, 
 ben717@andestech.com, tim609@andestech.com
To: Hui Min Mina Chou <minachou@andestech.com>
In-Reply-To: <20260330102724.1012470-6-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
Message-Id: <177487508031.2247754.831796651181832880.robh@kernel.org>
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,huawei.com,dabbelt.com,eecs.berkeley.edu,andestech.com,gmail.com,vger.kernel.org,bp.renesas.com,lists.infradead.org,glider.be,ghiti.fr];
	TAGGED_FROM(0.00)[bounces-30577-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,andestech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2ABD35B583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 18:27:22 +0800, Hui Min Mina Chou wrote:
> The AX45MP-specific cache binding is renamed to a generic Last Level
> Cache (LLC) schema, as the driver now supports more Andes CPU cores
> beyond just AX45MP.
> 
> Updated compatible strings:
>   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
>   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
>   andestech,ax45mp-cache          -> andestech,llcache
> 
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  ...ache.yaml => andestech,andes-llcache.yaml} | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/cache/andestech,llcache.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260330102724.1012470-6-minachou@andestech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


