Return-Path: <linux-renesas-soc+bounces-22881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA47BCC9AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 12:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9266C4EBAA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE46286422;
	Fri, 10 Oct 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RKH/Jlv1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52771BA3F;
	Fri, 10 Oct 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093516; cv=none; b=FKDE2pNQDCrFNhL6voODJnHs/A7Wlttxi1iziOXy3MU1Bx6hrQYjNKmob3rSL7gxDEa122YenBFXlKp1chrbndqARXQ1L+/zrcZ2d2V90oIXKfiGgOWpqQOgL9uElLi42VoSggXyDNrP3RKjwmzTCosTHsDf1347szWfMdPPiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093516; c=relaxed/simple;
	bh=DcFwrzVt2AoQSuSahT+XbG4Og+woxj59ROVu3BK/gOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=utgUbVtuKtVZd26KZROmSzIcyX7YmkW9MZCN5GCP7JRImu5IO3nf+QBNOUbi2Bgha7jkXi2V7o1UvwFXD4DTJHTegqWapPaClPM8LHRwj3aBPSqF+/gycnVjX46+pG660i9sZzC89RBVdmOr2ezlUbEytQNAw2ZWUVJiSezYfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RKH/Jlv1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1503C42B;
	Fri, 10 Oct 2025 12:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760093417;
	bh=DcFwrzVt2AoQSuSahT+XbG4Og+woxj59ROVu3BK/gOU=;
	h=From:Subject:Date:To:Cc:From;
	b=RKH/Jlv1qNNldhnj1H5C1/hqFgPdrio9HHm3T/hAp9sZyg0S5UJ9xSHYjd8dBI5lO
	 G9T/3ARAZKap3eYqwHXI7QcDs0GfC9PhvEuZGYmIA6AAhGgnURA/ZhshoN9byz0tHn
	 PbQZyA56BiyqC17UTE16890NXrd8YY3kO4bzqRvo=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/3] Add ISP and IVC to r9a09g057 boards
Date: Fri, 10 Oct 2025 11:51:29 +0100
Message-Id: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHl6GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3ezE7MyC+JSSYt0U09S0FGMLI4ukNGMloPqCotS0zAqwWdGxtbU
 AKe7Ec1sAAAA=
X-Change-ID: 20251010-kakip_dts-d5efd3828bf3
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=DcFwrzVt2AoQSuSahT+XbG4Og+woxj59ROVu3BK/gOU=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6OVHcuLaCw+VJZ6I+QBYTm4GUk+GBH3qBOSRR
 sJhcuxzqpyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjlRwAKCRDISVd6bEV1
 Mi+cD/9aY4XTpZ3kV5RiNN7rFLKzDa2NYt/llcv0MraccmxvgSkLmzlj+hZLODhE9RzwwNUPm4n
 jedbLYXOSVAP4YhXOBCDBcqYcREiWvT8boFsm+Uif2Ocaeij/df1D5wXPfnVfflmjxH7GkqLICA
 ONZ6b0ZhJvnqSyS77Ul1+NlrtjuvDhQUpjE9jiu+OqyFIkjbvmbBLDaVa3Lso8ndpMdqgaA11ih
 05BQPVhTNXTAj2BbcnofR4WrAkz/E2x713nr4Ou4HSEHlv8+HECZzg7qivBUuxNlJBbIeD1ilMv
 ICt8bgee8TnpQYcVLDLThoQwvz1V/TvySDqg+OVyHNuVESrhiW40Uc6o1yWtrb9hxMKskt/WYqe
 vFEyfURIhK14EO9gM4iCIOgDDADoliEsHLTw2SPVJeHFf7zVYMb6o5Lm75mrXtIJVC86JVFhspa
 uTVJYu8J+3qAk77Y1YffEGILW2Ug/MBeMYnqDBNBZKwkQpNDZulA5XhxC28QpuMIQQLgCQudmrj
 mO8znbizGGTJmyZUPz2mG8I1kuuTLYGb1Lst5jhcFpfY5tsS599eBulPENLBjWLHl1lsVj/d7iM
 jWBl05NQMvT9Jv/d6GC7AhpFgXO25BBUVyv/BWV6JBW0nlbYnZ2P+0yROZ4oHQEBM3LF/qDsHN0
 hHcpmyHzqPceUCg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This set adds device tree nodes describing the ARM Mali-C55 ISP and
its associated Input Video Control block found in the RZ/V2H(P) SoC
to r9a09g057.dtsi and enables both devices on the two boards that
currently inherit that file.

The devicetree bindings for the two new devices are not yet merged
upstream, so this set is based on top of them (or it generates
dtbs_check warnings):

ISP Set: https://lore.kernel.org/linux-media/20251002-c55-v12-0-3eda2dba9554@ideasonboard.com/
IVC Set: https://lore.kernel.org/linux-media/20251002-ivc-v5-0-192c663fa70b@ideasonboard.com/

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Daniel Scally (3):
      arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
      arm64: dts: renesas: r9a09g057h48-kakip: Add ISP and IVC nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 52 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |  8 ++++
 3 files changed, 68 insertions(+)
---
base-commit: a4370a10bddc1394d938790d5848edef6c81f4ac
change-id: 20251010-kakip_dts-d5efd3828bf3

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


