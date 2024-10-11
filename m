Return-Path: <linux-renesas-soc+bounces-9678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048E999F3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 10:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158741C21599
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2E320ADE7;
	Fri, 11 Oct 2024 08:44:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D620ADD9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636292; cv=none; b=OFMknNO8t/tYlGNqI5T9H5wpK73d4tbANP0z5HPw6KqUEov8y5zGe0Dy857a6YjvDd4rXs1KfIZozB1rudR6OzOqDxoglKcUmHofd2M48TujtYjZ14kE0wImnD+JEkeZw66+OBiqORVNctgaxebOVirGGxIV6aR7HdBSnFaAM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636292; c=relaxed/simple;
	bh=sh7Rkm8b3n5eh7mwtK6qQxBG5gK3S5uph9wPS9a6kXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIc9eRb3OKMSRe4LybI8biRtdKi5AgwYCArm5DPMNtkiIhmnfmF4IotpW/5SIn2pJFB5f+vAhxkyjumivC/vNiV/ZsucHO2EMGuobY2dI4ce6A/lMgfFiS6F89f+dsWh9G17ymjmzJnguhvr9cffG6x+J9UgYIv/ih4nZQhR9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b789:d7dc:2cd3:3131])
	by laurent.telenet-ops.be with cmsmtp
	id Nwkg2D0074apNaE01wkg37; Fri, 11 Oct 2024 10:44:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1szBG7-003cBZ-Kn;
	Fri, 11 Oct 2024 10:44:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1szBGJ-00DoDL-UT;
	Fri, 11 Oct 2024 10:44:39 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] [LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
Date: Fri, 11 Oct 2024 10:44:38 +0200
Message-Id: <9cdb288f9c800c34e42402de7dd64ed384b98213.1728634797.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/Five cannot be supported by the standard RISC-V defconfig due to its
dependency on NONPORTABLE.  Hence add a separate defconfig for Renesas
RZ/Five boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Not intended for upstream integration.
To be applied to my topic/renesas-defconfig branch, which already has
arch/arm64/configs/renesas_defconfig.

Tested with OpenEmbedded nodistro.0 smarc-rzfive (eMMC and nfsroot).

v2:
  - Add Reviewed-by, Tested-by,
  - Incorporate suggestions from Prabhakar:
      - Enable preemptible kernel, and GPIO regulator,
      - Disable PCI and XHCI,
      - Disable scheduler debugging, as it breaks USB host on CN1.
---
 MAINTAINERS                         |   3 +
 arch/riscv/configs/rzfive_defconfig | 216 ++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 arch/riscv/configs/rzfive_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a2aa2a1be720821..bf313685817e5228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2924,6 +2924,7 @@ F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/arm64/configs/renesas_defconfig
 F:	arch/riscv/boot/dts/renesas/
+F:	arch/riscv/configs/rzfive_defconfig
 F:	drivers/pmdomain/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
@@ -19880,6 +19881,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+X:	arch/riscv/configs/rzfive_defconfig
 N:	riscv
 K:	riscv
 
@@ -25752,3 +25754,4 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 F:	*
 F:	*/
 X:	arch/arm64/configs/renesas_defconfig
+X:	arch/riscv/configs/rzfive_defconfig
diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
new file mode 100644
index 0000000000000000..1757d97e65c8f1bc
--- /dev/null
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -0,0 +1,216 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PROFILING=y
+CONFIG_ARCH_RENESAS=y
+CONFIG_ERRATA_SIFIVE=y
+CONFIG_NONPORTABLE=y
+# CONFIG_RISCV_ISA_ZICBOM is not set
+# CONFIG_EFI is not set
+CONFIG_PM_AUTOSLEEP=y
+CONFIG_CPU_IDLE=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_JUMP_LABEL=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NETFILTER=y
+CONFIG_NET_SCHED=y
+CONFIG_NETLINK_DIAG=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CAN=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_PAGE_POOL_STATS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+# CONFIG_MTD_OF_PARTS is not set
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_MD=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_RAVB=y
+CONFIG_MICREL_PHY=y
+CONFIG_MICROSEMI_PHY=y
+CONFIG_VITESSE_PHY=y
+CONFIG_CAN_RCAR_CANFD=y
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_MOUSE_PS2 is not set
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_DA9063_ONKEY=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_HVC_RISCV_SBI=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_RIIC=y
+CONFIG_SPI=y
+CONFIG_SPI_RPCIF=y
+CONFIG_SPI_RSPI=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL_DA9062=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_DEBUGFS=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DA9062_THERMAL=y
+CONFIG_RZG2L_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_DA9062_WATCHDOG=y
+CONFIG_RENESAS_RZG2LWDT=y
+CONFIG_MFD_DA9062=y
+CONFIG_RZ_MTU3=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_PCM_TIMER is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_PROC_FS is not set
+# CONFIG_SND_CTL_FAST_LOOKUP is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_RZ=y
+CONFIG_SND_SOC_WM8978=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_RENESAS_USBHS=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_RENESAS_USBHS_UDC=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHI=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DA9063=y
+CONFIG_DMADEVICES=y
+CONFIG_RZ_DMAC=y
+CONFIG_SYNC_FILE=y
+CONFIG_COMMON_CLK_VC3=y
+CONFIG_RENESAS_OSTM=y
+CONFIG_MAILBOX=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_ARCH_R9A07G043=y
+CONFIG_EXTCON=y
+CONFIG_MEMORY=y
+CONFIG_RENESAS_RPCIF=y
+CONFIG_IIO=y
+CONFIG_RZG2L_ADC=y
+CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_AUTOFS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V2=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_V4_2_READ_PLUS is not set
+CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_PRINTK_TIME=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_WQ_CPU_INTENSIVE_REPORT=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_DEBUG_TIMEKEEPING=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_PLIST=y
+CONFIG_DEBUG_SG=y
+CONFIG_RCU_EQS_DEBUG=y
+# CONFIG_FTRACE is not set
+CONFIG_MEMTEST=y
-- 
2.34.1


