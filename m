Return-Path: <linux-renesas-soc+bounces-2177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 536548448A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 21:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB41C1F23B70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 20:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9125F3EA9B;
	Wed, 31 Jan 2024 20:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Q5dsLmhH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F083FB1B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732339; cv=none; b=I6I6pWh01bdkUMbqw2em7N8VP3sbkPBg1LFg+xD7pcW/VAB+0HKPbsl7H0T6FzvdHwKxmg/AIZf1suS6AP1HDE+N7cl3RQl4g2thCM9xRwubIWUPMrAfy+zxE+7NSc0XTosLuI7R93xTF+Gi1ZlssgjGB/c0hXdIgH623gqb2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732339; c=relaxed/simple;
	bh=w4VQ4rxIBHJhrvlHmE5AmfUjaGZ0pQSML2lYveNe+S0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=e4V0rBxsk+8BxbgrhHRamprHI1iWnUWsBlfHKwczFpEfbPYWDUTcHJYu/tPRpzfEptMQNAxnQfrkFrvtZGzs4FilXoWmmbDdXKJhtViqN+WOc88JAOfNAHEaBd46nJVrY6XEM7oh/4tD+lM05TbV99a/azOQAphCRMBsx3/bmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Q5dsLmhH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ddc0c02665so112480b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 12:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706732336; x=1707337136; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xnw8Gxjerg9ozB+W6wWx1Snru9LGqBwYoEaXXHPXbxM=;
        b=Q5dsLmhHGlQ+PIS7FUw+jpQKOsSVM+A2pWssRo+ZGW58E0oLM2trwvSlYH19XUF5E9
         3y+081wF1twSfFyoNF8DFHC47Zv8nBLLAsD8Qng6JWGd+plGwexbFoF0GdG4COEa6ZiG
         4XtcMfhCsA90KzyxaNja3NmzTPtDviHD3+/sdp7B+etwjivvoQHi68QJXYRX9CbnfThn
         EjtQhrtjzijuKMDPIg3u8g1ini3PbnK9lnQcMRPfjNYKPSxN8Dj75kY1FRxDXvV6X4dL
         gzTfwLjpjrq4sZBRX25AXkpfvxZEdrhtLWakfqRNBI2Wuek1oiMyYxn0CsNLuWhAOUpH
         82Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732336; x=1707337136;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnw8Gxjerg9ozB+W6wWx1Snru9LGqBwYoEaXXHPXbxM=;
        b=C30XEo1L7bQf36dtUx5XWDFXT2M7PToa0itAOflOIYDtLKmc1KWj63sOreCJvFawzz
         73+vYdzxdq+E/Ro9jeeF3NcX9QGErnT0uHzmuicQAJckElJuZfR5tOQp3kT6GsofVyRq
         RDP0bFLPDdA9BND7/+14pHKbZj6KBAVJhZgz8yro/iWgSaIxiMQfmrzrPB2A7BRWt8/o
         euqSIy71wPQO+9U5GdHd0hJc1Fi2+bkcxKV43XY5zv2woJZhc9PYeYo72YgjSPr6z+EX
         g/kV+ad88a4H/YsYQe7J/IcDNGXQMoQ43edcy78G/ervvlJr6Gwe02QWGvPEtAxMxKt+
         YNmw==
X-Gm-Message-State: AOJu0YxFfFBc/neOY8K11X08dCl8IlkXWo0wJvi+ATcakRe9Tw3Ge54Q
	91xNWrL8XrTs2wxPeb7d6gikynCOxcYw0d1SVuYdiu/M4HM3FfxqSKQ6I0+fIre1sB5+KJ25Cuj
	c
X-Google-Smtp-Source: AGHT+IG4BV7Ukw8xjNiiKVY3sRPOCAZcDppDRI82z6cUF0uAwpaVqV26aocpoCYIARrT4pQheTW9gQ==
X-Received: by 2002:a05:6a21:998b:b0:19c:8d73:7213 with SMTP id ve11-20020a056a21998b00b0019c8d737213mr3180776pzb.11.1706732336605;
        Wed, 31 Jan 2024 12:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWdHxc+vOzOl1hsrF1R7UbQ4KIsaBsZXdNydH5WXlNwf1wCYpUooOnopsB3TWNfDSjZUhlUdK6iAjIMCEVqoJiHBLlhCgqEMoyLDA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mf12-20020a170902fc8c00b001d8fc6fe1f6sm1511220plb.63.2024.01.31.12.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 12:18:56 -0800 (PST)
Message-ID: <65baab30.170a0220.52291.5860@mx.google.com>
Date: Wed, 31 Jan 2024 12:18:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2024-01-31-v6.8-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 21 runs,
 2 regressions (renesas-next-2024-01-31-v6.8-rc1)
To: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

renesas/next baseline-nfs: 21 runs, 2 regressions (renesas-next-2024-01-31-=
v6.8-rc1)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2024-01-31-v6.8-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2024-01-31-v6.8-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6fc5bb9da080f9f12f2dc13647a695846cb2f8f5 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
dove-cubox            | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ba79315914cea1b200a04e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ba79315914cea1b=
200a04f
        failing since 64 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-11-27-v6.7-rc1) =

 =



platform              | arch  | lab             | compiler | defconfig     =
     | regressions
----------------------+-------+-----------------+----------+---------------=
-----+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/65ba7b2e7cee7fa3a400a056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2024=
-01-31-v6.8-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65ba7b2e7cee7fa3a=
400a057
        failing since 9 days (last pass: renesas-next-2023-11-28-v6.7-rc1, =
first fail: renesas-next-2024-01-22-v6.8-rc1) =

 =20

